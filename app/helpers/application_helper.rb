module ApplicationHelper
  def pageTitle (main_title, sub_title)
    output='<div class="page-header"><h1>'+main_title
    output += '<br/><small>'+sub_title+'</small>'
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
    output += ' <li>' + destroyLink(ressource).html_safe + '</li>'
    output += '</ul>'
    return output.html_safe
  end
end
