import React from "react";

const Footer = () => {
    return (
        <footer className="white-section py-4 border-top">
            <div className="container-fluid text-center">
                <p className="mb-1 text-center">&copy; {new Date().getFullYear()} Christian Onyeukwu. All rights reserved.</p>
                <ul className="list-inline mb-0">
                    <li className="list-inline-item mx-2">
                        <a href="#about" className="text-decoration-none text-dark">About</a>
                    </li>
                    <li className="list-inline-item mx-2">
                        <a href="#projects" className="text-decoration-none text-dark">Projects</a>
                    </li>
                    <li className="list-inline-item mx-2">
                        <a href="#contact" className="text-decoration-none text-dark">Contact</a>
                    </li>
                    <li className="list-inline-item mx-2">
                        <a href="#blog" className="text-decoration-none text-dark">Blog</a>
                    </li>
                </ul>
            </div>
        </footer>
    );
};

export default Footer;
