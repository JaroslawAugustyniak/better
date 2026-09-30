document.addEventListener('DOMContentLoaded', () => {
    const wrappers = document.querySelectorAll('.cyb-wrapper');
    
    wrappers.forEach(wrapper => {
        const playBtn = wrapper.querySelector('.play-button');
        const cover = wrapper.querySelector('.cyb-cover');
        const videoContainer = wrapper.querySelector('.cyb-video-container');
        const iframe = videoContainer.querySelector('iframe');


        playBtn.addEventListener('click', () => {
            cover.style.display = 'none';
            videoContainer.style.display = 'block';
            
            // Dodanie autoplay po kliknięciu
            const currentSrc = iframe.getAttribute('src');
            iframe.setAttribute('src', currentSrc + '&autoplay=1&rel=0&modestbranding=1&showinfo=0&controls=1&fs=1');
        });
    });
});