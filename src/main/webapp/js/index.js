document.addEventListener('DOMContentLoaded', () => {
    // Selecciona todos los elementos con la clase 'animate-on-scroll'
    const animateElements = document.querySelectorAll('.animate-on-scroll');

    // Configura el Intersection Observer
    const observer = new IntersectionObserver(
        (entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    // Obtén la animación y el retraso desde los atributos
                    const animationClass = entry.target.dataset.animation || 'animate__fadeIn';
                    const delay = entry.target.dataset.delay || '0s';

                    // Aplica el retraso usando estilos en línea
                    entry.target.style.animationDelay = delay;

                    // Agrega las clases de animación
                    entry.target.classList.add('animate__animated', animationClass);

                    // Deja de observar el elemento después de animarlo
                    observer.unobserve(entry.target);
                }
            });
        },
        {
            threshold: 0.05, // El 5% del elemento debe ser visible
        }
    );

    // Observa cada elemento animable
    animateElements.forEach(el => observer.observe(el));
});