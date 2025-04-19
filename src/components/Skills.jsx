import React, { useState } from 'react';
import skills from '../data/skills';


const Skills = () => {
    const [animate, setAnimate] = useState(false);

    const handleMouseEnter = () => {
        setAnimate(true);
    };

    const handleMouseLeave = () => {
        setAnimate(false); // Optional: reset if you want it to restart on every hover
    };

    return (
        <section
            className="colored-section"
            id="skills"
            onMouseEnter={handleMouseEnter}
            onMouseLeave={handleMouseLeave}
        >
            <div className="container-fluid">
                <h2 className="text-center mb-4">Skills & Expertise</h2>

                {skills.map((skill, index) => (
                    <div key={index} className="mb-3">
                        <div className="d-flex justify-content-between">
                            <strong>{skill.name}</strong>
                            <span>{skill.level}%</span>
                        </div>
                        <div className="progress">
                            <div
                                className="progress-bar"
                                role="progressbar"
                                style={{
                                    width: animate ? `${skill.level}%` : '0%',
                                }}
                                aria-valuenow={animate ? skill.level : 0}
                                aria-valuemin="0"
                                aria-valuemax="100"
                            ></div>
                        </div>
                    </div>
                ))}
            </div>
        </section>
    );
};

export default Skills;
