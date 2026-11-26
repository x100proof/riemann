# ζ(½ + it)

An animated, single-page visualization of the Riemann zeta function and the primes:

- **Input plane:** a point climbs the critical line s = ½ + it. Each zero is marked as it is passed, with a sparkline of that zero's wave beside it.
- **Output plane:** the curve traced by ζ(½ + it). It passes through the origin exactly at each zero.
- **Prime counting function:** each time the curve hits 0, that zero's term of Riemann's explicit formula is added to an approximation of π(x). Over the first 1000 zeros the approximation sharpens from the smooth R(x) into the true prime staircase.

Controls: the real part σ (off σ = ½ the curve never hits 0), how fast t increases, Pause and Restart.

## How it works

- ζ(s) is evaluated in the browser by Euler–Maclaurin summation.
- The heights of the first 1000 zeros are embedded in the page. They were computed with [mpmath](https://mpmath.org/) (`mpmath.zetazero(n)` for n = 1 … 1000).
- π(x) uses Riemann's formula π(x) = Σ μ(n)/n · J(x^{1/n}), where J(y) = li(y) − Σ_ρ li(y^ρ) − log 2 + ∫_y^∞ dt / (t(t² − 1) log t). The li(y^ρ) terms are computed as exponential integrals using a continued fraction.

## Running locally

The app is one HTML file with no build step and no dependencies. Fonts load from Google Fonts. Open `index.html` in a browser, or serve the directory:

```sh
python3 -m http.server 8000 --bind 127.0.0.1
# then visit http://127.0.0.1:8000/
```

## Deploying

Any static web host works: publish `index.html` as the site's index page.

To copy it into a web server's document root on the same machine:

```sh
./deploy.sh /path/to/docroot
```

For example, a minimal nginx server block for a static site:

```nginx
server {
    listen 80;
    server_name example.com;
    root /var/www/riemann;
    index index.html;
    location / { try_files $uri $uri/ =404; }
}
```

Add TLS (for example with Let's Encrypt) before serving it publicly.
