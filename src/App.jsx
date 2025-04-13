import React from "react";
import Header from "./components/Header";
import About from "./components/About";
import Recommendation from "./components/Recommendation";
import Projects from "./components/Projects";
import Skills from "./components/Skills";
import Contact from "./components/Contact";
import 'bootstrap/dist/css/bootstrap.min.css';
import "bootstrap/dist/js/bootstrap.bundle.min.js";
import '@fontsource/inter'; // Defaults to weight 400
import '@fontsource/inter/300.css'; // Light
import '@fontsource/inter/700.css'; // Bold
import "@fontsource/ubuntu"; // Default weight 400
import "@fontsource/ubuntu/700.css"; // Bold weight
import '@fontsource/sora/400.css';
import '@fontsource/sora/600.css';
import '@fontsource/sora/700.css';
import "./styles.css";


function App() {
  return (
    <div>
      <Header />
      <About />
      <Recommendation />
      <Projects />
      <Skills />
      <Contact />
    </div>
  );
}

export default App;