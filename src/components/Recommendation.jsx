import React from "react"
import CaroselContent from "./CaroselContent";
import recommendations from "../data/recommendations"




function Recommendation() {

    return (
        <section className="colored-section" id="testimonial">
            <div id="caroselRecommendationRide" className="carousel slide" data-bs-ride="true">
                <div className="carousel-inner">

                    {recommendations.map((recommendation, index) => <CaroselContent
                        key={recommendation.id}
                        active={index === 0}
                        message={recommendation.message}
                        photo={recommendation.photo}
                        name={recommendation.name}
                        title={recommendation.title}
                    />)}

                </div>
                <button className="carousel-control-prev" type="button" data-bs-target="#caroselRecommendationRide" data-bs-slide="prev">
                    <span className="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span className="visually-hidden">Previous</span>
                </button>
                <button className="carousel-control-next" type="button" data-bs-target="#caroselRecommendationRide" data-bs-slide="next">
                    <span className="carousel-control-next-icon" aria-hidden="true"></span>
                    <span className="visually-hidden">Next</span>
                </button>
            </div>


        </section>
    );
}
export default Recommendation;