import React from "react";
import projects from "../data/projects";
import ProjectContent from "./ProjectContent";

console.log(projects)

const Projects = () => {
    return (
        <section className="py-5 white-section" id="projects">
            <div className="container-fluid">
                <h2 className="mb-4 text-center">Featured Projects</h2>
                <div className="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
                    {projects.map((project) => (
                        // <ProjectContent
                        //     key={project.id}
                        //     src={project.image}
                        //     alt={project.title}
                        //     title={project.title}
                        //     description={project.description}
                        //     href={project.link}
                        // />
                        <div className="col" key={project.id}>
                            <div className="card h-100 shadow-sm">
                                <img
                                    src={project.image}
                                    className="card-img-top"
                                    alt={project.title}
                                    style={{ height: "225px", objectFit: "cover" }}
                                />
                                <div className="card-body d-flex flex-column">
                                    <h5 className="card-title">{project.title}</h5>
                                    <p className="card-text flex-grow-1">{project.description}</p>
                                    <div className="mt-3">
                                        <a href={project.link} className="btn btn-outline-light btn-sm">View Project</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    ))}
                </div>
            </div>
        </section>
    );
};

export default Projects;