document.addEventListener('DOMContentLoaded', () => {
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme) {
        document.documentElement.setAttribute('data-theme', savedTheme);
    }
});

document.getElementById('dark-mode-toggle').addEventListener('click', () => {
    const currentTheme = document.documentElement.getAttribute('data-theme');
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);
});

// document.addEventListener('DOMContentLoaded', () => {
//     // Apply saved theme on page load
//     const savedTheme = localStorage.getItem('theme');
//     if (savedTheme) {
//         document.documentElement.setAttribute('data-theme', savedTheme);
//     }

//     // Toggle dark mode and save preference
//     document.getElementById('dark-mode-toggle').addEventListener('click', () => {
//         const currentTheme = document.documentElement.getAttribute('data-theme');
//         const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
//         document.documentElement.setAttribute('data-theme', newTheme);
//         localStorage.setItem('theme', newTheme);
//     });
// });
