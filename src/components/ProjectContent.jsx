import React from "react"

const ProjectContent = (props) => {
    <div className="col" key={props.id}>
        <div className="card h-100 shadow-sm">
            <img
                src={props.image}
                className="card-img-top"
                alt={props.title}
                style={{ height: "225px", objectFit: "cover" }}
            />
            <div className="card-body d-flex flex-column">
                <h5 className="card-title">{props.title}</h5>
                <p className="card-text flex-grow-1">{props.description}</p>
                <div className="mt-3">
                    <a href={props.link} className="btn btn-outline-light btn-sm">View Project</a>
                </div>
            </div>
        </div>
    </div>
}
export default ProjectContent;