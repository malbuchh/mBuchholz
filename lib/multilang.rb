def language_code_of(item)
  if item.identifier == '/' then 'en' else
    (item.identifier.match(/^\/([a-z]{2})\//) || [])[1]
  end
end

def translations_of(item)
  @items.select do |i| 
    if i.identifier != '/' then
        i[:canonical_identifier] == item[:canonical_identifier]
    end
  end
end

LANGUAGE_CODE_TO_NAME_MAPPING = {
  'en' => 'English',
  'de' => 'Deutsch',
  'tr' => 'Türkçe'
}

PAGE_NAMES = {
    'en' => {
        'about' => 'About',
        'contact' => 'Contact',
        'projects' => 'Projects'
    },
    'de' => {
        'about' => 'Profil',
        'contact' => 'Kontakt',
        'projects' => 'Referenzen'
    },    
   'tr' => {
        'about' => 'Profil',
        'contact' => 'Kontak',
        'projects' => 'Referanslar'
    }
}

def language_name_for_code(code)
  LANGUAGE_CODE_TO_NAME_MAPPING[code]
end

def language_name_of(item)
  language_name_for_code(
    language_code_of(item))
end
