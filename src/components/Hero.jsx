import React from "react";
import { FaGithub, FaLinkedin, FaEnvelope, FaFileDownload } from "react-icons/fa";

const Hero = () => {
    return (
        /* Title */
        <div className="row">
            <div className="col-lg-6">
                <p>Hello, I'm </p>
                <h1 className="big-heading">Christian Onyeukwu</h1>
                <p>DevOps Engineer & Cloud Specialist driving automation, cloud-native deployments, and scalable infrastructure.Skilled in Docker, Kubernetes, Jenkins, Ansible, Terraform, and AWS.Proven results: 80% fewer deployment errors, release cycles cut from 3 hours to 25 minutes, 98% uptime achieved in production environments.</p>
                <a
                    href="https://github.com/christianRibig5"  // Provide the path to your resume (make sure it's in the public folder)
                    target="_blank"
                    rel="noopener noreferrer"
                    className="btn btn-outline-light btn-lg download-button gt-button"
                >
                    <FaGithub size={20} /> View GitHub
                </a>
                {/* <a className="btn btn-outline-light btn-lg gt-button" href="#contact">
                    GET IN TOUCH
                </a> */}
                <div className="social">
                    <a className="btn btn-outline" href="https://github.com/christianRibig5" target="_blank" role="button"><FaGithub /></a>
                    <a className="btn btn-outline" href="https://www.linkedin.com/in/christianonyeukwu/" target="_blank"><FaLinkedin role="button" /></a>
                    <a className="btn btn-outline" href="mailto:christianonyeukwu@gmail.com" role="button"><FaEnvelope /></a>
                </div>
            </div>
            <div className="col-lg-6">
                <img className="title-image hero-wave" src={`${import.meta.env.BASE_URL}images/chris-1.png`} alt="personal-photo"></img>
            </div>
        </div>

    );
};

export default Hero;