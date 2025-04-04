import React from 'react';

const Footer = () => {
    return (
        <footer style={styles.footer}>
            <p>&copy; 2025 Christian Onyeukwu. All rights reserved.</p>
        </footer>
    );
};

const styles = {
    footer: {
        backgroundColor: '#333',
        color: 'white',
        padding: '10px',
        textAlign: 'center',
        marginTop: '20px',
    },
};

export default Footer;