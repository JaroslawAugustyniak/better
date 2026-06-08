document.addEventListener('DOMContentLoaded', function() {
    const galleries = document.querySelectorAll('.gallery-container');

    galleries.forEach((container) => {
        const slides = container.querySelectorAll('.gallery-main-slide');
        const thumbs = container.querySelectorAll('.gallery-thumb');
        const prevBtn = container.querySelector('.gallery-prev');
        const nextBtn = container.querySelector('.gallery-next');

        let currentIndex = 0;

        const showSlide = (index) => {
            currentIndex = (index + slides.length) % slides.length;

            slides.forEach(slide => slide.classList.remove('active'));
            slides[currentIndex].classList.add('active');

            thumbs.forEach((thumb, i) => {
                thumb.classList.toggle('active', i === currentIndex);
            });
        };

        prevBtn?.addEventListener('click', () => showSlide(currentIndex - 1));
        nextBtn?.addEventListener('click', () => showSlide(currentIndex + 1));

        thumbs.forEach((thumb, index) => {
            thumb.addEventListener('click', () => showSlide(index));
        });

        showSlide(0);
    });
});