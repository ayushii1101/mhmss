<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Contact Us – ManSparsh</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<style>
/* INDUSTRIAL RESET - Enterprise Standards */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

:root {
    --primary-purple: #6f63ff;
    --purple-dark: #5a4fff;
    --purple-light: #8b7eff;
    --purple-glow: rgba(111, 99, 255, 0.2);
    --dark-bg: #0f0f23;
    --card-bg: #1a1a2e;
    --text-light: #e0e6ff;
    --text-muted: #a0a8c0;
}

html {
    scroll-behavior: smooth;
}

body {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
    background: linear-gradient(135deg, #0f0f23 0%, #1a1a2e 100%);
    color: var(--text-light);
    min-height: 100vh;
    line-height: 1.6;
}

/* ENTERPRISE NAVBAR */
.navbar {
    background: rgba(15, 15, 35, 0.95);
    backdrop-filter: blur(20px);
    border-bottom: 1px solid var(--purple-glow);
    height: 70px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 5%;
    position: sticky;
    top: 0;
    z-index: 1000;
}

.logo {
    font-size: 28px;
    font-weight: 800;
    background: linear-gradient(135deg, var(--primary-purple), #fff);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 2rem;
}

.nav-links a {
    color: var(--text-light);
    text-decoration: none;
    font-weight: 500;
    font-size: 16px;
    padding: 0.5rem 1rem;
    border-radius: 8px;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
}

.nav-links a:hover {
    background: var(--purple-glow);
    color: var(--primary-purple);
    transform: translateY(-2px);
}

/* ENTERPRISE DROPDOWN */
.dropdown {
    position: relative;
}

.dropdown-content {
    display: none;
    position: absolute;
    top: 100%;
    right: 0;
    background: var(--card-bg);
    min-width: 200px;
    border-radius: 12px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.4), 0 0 0 1px var(--purple-glow);
    border: 1px solid var(--purple-glow);
    margin-top: 8px;
    overflow: hidden;
}

.dropdown-content a {
    color: var(--text-light);
    padding: 1rem 1.5rem;
    display: block;
    font-size: 15px;
    transition: all 0.3s ease;
}

.dropdown-content a:hover {
    background: var(--primary-purple);
    color: white;
}

.dropdown:hover .dropdown-content {
    display: block;
    animation: slideDown 0.3s ease-out;
}

@keyframes slideDown {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}

/* HERO SECTION - Industrial Design */
.hero-section {
    background: linear-gradient(135deg, var(--primary-purple) 0%, var(--purple-dark) 50%, var(--purple-light) 100%);
    padding: 120px 5% 80px;
    text-align: center;
    position: relative;
    overflow: hidden;
}

.hero-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-image: 
        radial-gradient(circle at 20% 80%, rgba(255,255,255,0.1) 0%, transparent 50%),
        radial-gradient(circle at 80% 20%, rgba(255,255,255,0.05) 0%, transparent 50%);
    pointer-events: none;
}

.hero-title {
    font-size: clamp(2.5rem, 5vw, 4rem);
    font-weight: 800;
    margin-bottom: 1.5rem;
    position: relative;
}

.hero-subtitle {
    font-size: clamp(1.2rem, 3vw, 1.8rem);
    font-weight: 600;
    margin-bottom: 2rem;
    opacity: 0.95;
}

.hero-text {
    max-width: 700px;
    margin: 0 auto 3rem;
    font-size: 1.2rem;
    opacity: 0.9;
}

/* CONTACT CARDS - Industrial Grid */
.contact-grid {
    max-width: 1000px;
    margin: 0 auto;
    padding: 0 5%;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 2rem;
    margin-bottom: 100px;
}

.contact-card {
    background: var(--card-bg);
    border: 1px solid var(--purple-glow);
    border-radius: 20px;
    padding: 2.5rem;
    position: relative;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    overflow: hidden;
}

.contact-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 4px;
    background: linear-gradient(90deg, var(--primary-purple), var(--purple-light), var(--primary-purple));
}

.contact-card:hover {
    transform: translateY(-12px);
    box-shadow: 
        0 30px 60px rgba(111, 99, 255, 0.25),
        0 0 0 1px var(--primary-purple);
}

.contact-icon {
    width: 70px;
    height: 70px;
    background: linear-gradient(135deg, var(--primary-purple), var(--purple-light));
    border-radius: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.8rem;
    margin-bottom: 1.5rem;
    box-shadow: 0 12px 30px rgba(111, 99, 255, 0.4);
}

.contact-label {
    font-weight: 700;
    color: var(--primary-purple);
    font-size: 1.1rem;
    margin-bottom: 1rem;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.contact-link {
    font-size: 1.3rem;
    color: var(--text-light);
    text-decoration: none;
    font-weight: 500;
    display: block;
    word-break: break-all;
}

.contact-link:hover {
    color: var(--primary-purple);
}

/* PRIVACY STATEMENT */
.privacy-section {
    max-width: 800px;
    margin: 0 auto 6rem;
    padding: 2rem 5%;
    text-align: center;
    background: rgba(111, 99, 255, 0.08);
    border: 1px solid var(--purple-glow);
    border-radius: 16px;
}

.privacy-text {
    font-size: 1.1rem;
    font-style: italic;
    opacity: 0.9;
}

/* ENTERPRISE FOOTER */
.footer {
    background: var(--dark-bg);
    border-top: 1px solid var(--purple-glow);
    text-align: center;
    padding: 1.5rem 5%;
    font-size: 0.95rem;
    color: var(--text-muted);
}

/* MOBILE ENTERPRISE */
@media (max-width: 768px) {
    .navbar {
        padding: 0 5%;
        flex-direction: column;
        height: 90px;
        gap: 1rem;
    }
    
    .nav-links {
        gap: 1rem;
    }
    
    .hero-section {
        padding: 80px 5% 60px;
    }
    
    .contact-grid {
        grid-template-columns: 1fr;
        gap: 1.5rem;
        padding: 0 5%;
    }
    
    .contact-card {
        padding: 2rem;
    }
}

@media (max-width: 480px) {
    .logo { font-size: 1.4rem; }
    .nav-links a { font-size: 0.9rem; }
}

/* ENTERPRISE ANIMATIONS */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}

.contact-card, .privacy-section {
    animation: fadeInUp 0.8s ease-out;
}
</style>
</head>
<body>

<!-- ENTERPRISE NAVBAR -->
<div class="navbar">
    <div class="logo">ManSparsh</div>
    <div class="nav-links">
        <a href="Home Page.jsp">Home</a>
        <a href="AboutUs.jsp">About Us</a>
        <a href="Features.jsp">Features</a>
        <div class="dropdown">
            <a>Login</a>
            <div class="dropdown-content">
                <a href="StudentLogin.jsp">Student</a>
                <a href="CounselorLogin.jsp">Counselor</a>
                <a href="FacultyLogin.jsp">Faculty</a>
            </div>
        </div>
        <a href="ContactUs.jsp">Contact Us</a>
    </div>
</div>

<!-- INDUSTRIAL HERO -->
<section class="hero-section">
    <h1 class="hero-title">Contact Us</h1>
    <h2 class="hero-subtitle">We're here to help - reach out to ManSparsh anytime</h2>
    <div class="hero-text">
        <p>Whether you have a question, need guidance, or want to know more about our support services, we're just one message away.</p>
    </div>
</section>

<!-- ENTERPRISE CONTACT GRID -->
<div class="contact-grid">
    <div class="contact-card">
        <div class="contact-icon">
            <i class="fas fa-envelope"></i>
        </div>
        <div class="contact-label">Email Us</div>
        <a href="https://mail.google.com/mail/?view=cm&fs=1&to=mansparshhelp@gmail.com" target="_blank" class="contact-link">
            mansparshhelp@gmail.com
        </a>
    </div>
</div>

<!-- PRIVACY STATEMENT -->
<div class="privacy-section">
    <div class="privacy-text">
        Your privacy matters. All conversations and queries are kept strictly confidential.
    </div>
</div>

<!-- ENTERPRISE FOOTER -->
<footer class="footer">
    © 2026 ManSparsh Online Counseling & Therapy. All rights reserved.
</footer>

</body>
</html>
