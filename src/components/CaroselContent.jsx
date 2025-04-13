import React from "react";
import { FaLinkedin } from "react-icons/fa";

const CaroselContent = (props) => {
    return (
        <div className={`carousel-item ${props.active ? "active" : ""} container-fluid`}>
            <h2 className="testimonial-text">
                {props.message}
            </h2>
            <img src={props.photo} className="testimonial-image" alt="profile-image" />
            <em className="recomder-detail"><span>{props.name},</span> {props.title}<a className="btn btn-outline" href="https://www.linkedin.com/in/christianonyeukwu/" target="_blank"><FaLinkedin role="button" /></a></em>
        </div>

    );

}
export default CaroselContent;