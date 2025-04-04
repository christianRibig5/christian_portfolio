import React from 'react';
import Hero from './Hero';
import Nav from './Nav';
function Header() {
    return (
        <section className="colored-section" id="title">
            <div className='container-fluid'>
                <Nav />
                <Hero />
            </div>
        </section>
    );
};



export default Header;