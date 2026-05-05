<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test iFrame</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f5f5f5;
        }

        .iframe-container {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        iframe {
            display: block;
            width: 100%;
            border: none;
            min-height: 400px;
        }
    </style>
</head>
<body>
    <div class="iframe-container">
        <iframe
            id="dynamicIframe"
            src="https://felg.app/extcal/4120001809956847"
            title="Zawartość zewnętrznej strony"
            allow="autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        ></iframe>
    </div>

    <script>
        const iframe = document.getElementById('dynamicIframe');

        // Metoda 1: Nasłuchiwanie wiadomości z iFrame (jeśli zewnętrzna strona to obsługuje)
        window.addEventListener('message', function(event) {
            // Weryfikacja pochodzenia wiadomości (dla bezpieczeństwa)
            if (event.origin !== 'https://felg.app') return;

            // Jeśli zewnętrzna strona wysyła wysokość
            if (event.data && event.data.height) {
                iframe.style.height = event.data.height + 'px';
            }
        });

        // Metoda 2: ResizeObserver - próba obserwacji zmian (może nie działać z cross-origin)
        if (window.ResizeObserver) {
            try {
                const resizeObserver = new ResizeObserver(() => {
                    // Spróbuj uzyskać dostęp do contentDocument (jeśli same-origin)
                    try {
                        const iframeDoc = iframe.contentDocument;
                        if (iframeDoc && iframeDoc.body) {
                            const height = iframeDoc.body.scrollHeight;
                            if (height > 0) {
                                iframe.style.height = (height + 20) + 'px';
                            }
                        }
                    } catch (e) {
                        // Cross-origin - brak dostępu do contentDocument
                    }
                });
                resizeObserver.observe(iframe);
            } catch (e) {
                console.log('ResizeObserver nie dostępny');
            }
        }

        // Metoda 3: Periodyczne sprawdzenie wysokości (fallback)
        // Niektóre przeglądarki/strony mogą to wspierać
        function checkIframeHeight() {
            try {
                const iframeDoc = iframe.contentDocument || iframe.contentWindow.document;
                if (iframeDoc) {
                    const height = Math.max(
                        iframeDoc.body.scrollHeight,
                        iframeDoc.documentElement.scrollHeight,
                        iframeDoc.body.offsetHeight,
                        iframeDoc.documentElement.offsetHeight
                    );
                    if (height > 0) {
                        iframe.style.height = (height + 20) + 'px';
                    }
                }
            } catch (e) {
                // Cross-origin - to jest oczekiwane
            }
        }

        // Sprawdzaj wysokość po załadowaniu oraz okresowo
        iframe.addEventListener('load', function() {
            setTimeout(checkIframeHeight, 500);
            setInterval(checkIframeHeight, 2000);
        });
    </script>
</body>
</html>
