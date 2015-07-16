class TopStoredProcedures < ActiveRecord::Migration
  def self.up
    execute <<-__EOI
    CREATE DEFINER=`root`@`localhost` PROCEDURE `createTop`(IN p_mode INTEGER, IN p_limite INTEGER)
      BEGIN
        DECLARE v_finished INT DEFAULT 0;
        DECLARE v_joueur VARCHAR(200);
        DECLARE v_moyenne FLOAT;
        DECLARE v_rang INT DEFAULT 1;

        -- declare cursor for top
        DECLARE c_top CURSOR FOR
          SELECT j.id, avg(jmc.elo) as moyenne
          FROM joueurs j, joueur_modes jm, joueur_modes_categories jmc, categories c
          WHERE j.id = jm.joueur_id
                AND jm.id = jmc.joueur_mode_id
                AND c.id = jmc.category_id
                AND c.is_serious = TRUE
                AND j.is_active = TRUE
                AND jm.mode_id = p_mode
          GROUP BY j.pseudo
          ORDER BY moyenne DESC
          LIMIT p_limite;

        -- declare NOT FOUND handler
        DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET v_finished = 1;

        OPEN c_top;

        set_top: LOOP
          FETCH c_top INTO v_joueur, v_moyenne;

          INSERT INTO tops(rang, joueur_id, mode_id, elo, created_at, updated_at)
          VALUES (v_rang, v_joueur, p_mode, v_moyenne, NOW(), NOW());

          SET v_rang = v_rang + 1;

          IF v_finished = 1 THEN
            LEAVE set_top;
          END IF;

          IF v_rang = p_limite + 1 THEN
            LEAVE set_top;
          END IF;

        END LOOP set_top;

      END;
    __EOI

    execute <<-__EOI
    CREATE DEFINER=`root`@`localhost` PROCEDURE `buildTop20`()
      BEGIN
        DECLARE v_finished INTEGER DEFAULT 0;
        DECLARE v_modes INTEGER;

        -- declare cursor for modes
        DEClARE c_modes CURSOR FOR
          SELECT id FROM modes;

        -- declare NOT FOUND handler
        DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET v_finished = 1;

        OPEN c_modes;

        FETCH c_modes INTO v_modes;

        get_modes: LOOP
          CALL createTop(v_modes, 20);

          FETCH c_modes INTO v_modes;

          IF v_finished = 1 THEN
            LEAVE get_modes;
          END IF;

        END LOOP get_modes;

        CLOSE c_modes;

      END;
    __EOI

    execute <<-__EOI
    CREATE EVENT e_call_buildTop20
      ON SCHEDULE EVERY 1 WEEK
    DO CALL buildTop20();
    __EOI
  end
end
