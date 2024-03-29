# -*- encoding : utf-8 -*-
module ApplicationHelper
  def pageTitle (main_title, sub_title = "")
    output='<div class="page-header"><h1>' + main_title
    if not sub_title.blank?
      output += '<br/><small>'+sub_title+'</small>'
    end
    output += '</h1></div>'
    return output.html_safe
  end

  def showLink (showPath)
    return link_to '<i class="glyphicon glyphicon-eye-open success"></i>'.html_safe, showPath,
                   title: 'Consulter les informations détaillées'
  end

  def editLink (editPath)
    return link_to '<i class="glyphicon glyphicon-pencil info"></i>'.html_safe, editPath,
                   title: 'Modifier les informations'
  end

  def destroyLink (ressource)
    return link_to '<i class="glyphicon glyphicon-trash danger"></i>'.html_safe, ressource,
                   method: :delete,
                   data: { confirm: 'Êtes-vous sûr?' }
  end

  def ressourceActionLinks (ressource, showPath, editPath)
    output = '<ul class="ressource-action-links list-inline">'
    output += ' <li>' + showLink(showPath).html_safe + '</li>'
    output += ' <li>' + editLink(editPath).html_safe + '</li>'
    if not ressource.nil?
      output += ' <li>' + destroyLink(ressource).html_safe + '</li>'
    end
    output += '</ul>'
    return output.html_safe
  end

  def is_active_player? joueur
    if not joueur.is_active
      output = '<span class="has-hover" data-toggle="tooltip" title="Ce joueur est inactif">'
      output += '<i class="glyphicon glyphicon-flag"></i>'
      output += '</span>'
      return output.html_safe
    end
  end

  def is_top_player? joueur, mode
    res = Top.where(joueur_id: joueur.id)
              .where(mode_id: Mode.where(nom: mode))
              .where(created_at: Top.maximum("created_at"))
              .first()

    if not res.nil?
      output = '<span class="has-hover" data-toggle="tooltip" title="Numéro ' + String(res.rang) + ' au classement cette semaine !">'
      output += '<i class="glyphicon glyphicon-star-empty"></i>'
      output += '</span>'
      return output.html_safe
    end
  end
end
