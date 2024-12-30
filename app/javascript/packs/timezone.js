const userTimeZone = Intl.DateTimeFormat().resolvedOptions().timeZone;

const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

fetch('/set_timezone', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
    },
    body: JSON.stringify({ timezone: userTimeZone })
})
    .catch(error => {
        console.error(error);
    });