import React from "react";

const Skills = () => {
    const skills = ["React", "JavaScript", "Node.js", "MongoDB", "Tailwind CSS"];

    return (
        <section id="skills" className="skills">
            <h2>Skills</h2>
            <ul>
                {skills.map((skill, index) => (
                    <li key={index}>{skill}</li>
                ))}
            </ul>
        </section>
    );
};

export default Skills;