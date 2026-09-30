# Sitemap All

Generuje kompletną XML mapę strony zawierającą wszystkie typy wpisów dostępne w WordPressie.

## Instalacja

1. Plugin jest już zainstalowany w katalogu `/wp-content/plugins/sitemap-all/`
2. Aktywuj plugin w panelu administracyjnym WordPressa

## Użycie

Mapa strony dostępna jest pod adresem:

```
https://example.com/sitemap_all.xml
```

## Charakterystyka

- ✅ Zawiera wszystkie publiczne typy postów (pages, posts, custom post types)
- ✅ Respektuje ustawienia permalinków WordPress
- ✅ Pokazuje datę ostatniej modyfikacji dla każdego wpisu
- ✅ Cache na 1 godzinę
- ✅ Nie koliduje z Rank Math SEO ani innymi pluginami
- ✅ Prosty i lekki kod

## Włączanie do robots.txt

Dodaj do pliku `robots.txt` w katalogu głównym serwisu:

```
Sitemap: https://example.com/sitemap_all.xml
```

## Wymagania

- WordPress 5.0+
- PHP 7.2+

## FAQ

**P: Czy to zastępuje sitemap z Rank Math?**  
O: Nie, to jest dodatek. Obie sitemappy mogą działać razem.

**P: Czy zmienia ustawienia WordPressa?**  
O: Nie, plugin jest całkowicie non-invasive.

**P: Gdzie szukać mapy?**  
O: `https://twoja-domena.com/sitemap_all.xml`
