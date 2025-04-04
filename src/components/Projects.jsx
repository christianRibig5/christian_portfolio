import React from "react";

const Projects = () => {
    const projects = [
        { title: "E-commerce Website", description: "React, Firebase, Stripe" },
        { title: "Portfolio Website", description: "React, Tailwind CSS" },
        { title: "Chat App", description: "React, Node.js, Socket.io" },
    ];

    return (
        <section id="projects" className="projects">
            <h2>Projects</h2>
            <div className="project-list">
                {projects.map((project, index) => (
                    <div key={index} className="project-card">
                        <h3>{project.title}</h3>
                        <p>{project.description}</p>
                    </div>
                ))}
            </div>
        </section>
    );
};

export default Projects;