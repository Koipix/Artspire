import express, { Request, Response } from 'express';
import { ArtItemWithArtist } from './models/ArtItem';

const item: ArtItemWithArtist[] = [  
  {
    id: 1,
    title: "YCH - Full Illustration Commission",
    description: "A fully detailed character illustration tailored to your style preferences.",
    details: "Includes high-resolution PNG, PSD layers, and optional minor revisions.",
    price: 3600,
    monetization_rate: 1.5,
    commercial_rate: 2,
    image_url: "https://cdn.donmai.us/original/05/b6/05b6f0fe636667a8962b0aaebd6e89a9.png",
    category: "Illustration",
    status: "Open",
    is_new_offer: true,
    avgRating: 4.6,
    ratingCount: 110,
    created_at: new Date(),
    artist: {
      id: 25,
      username: "Arona",
      pfp_url: "https://cdn.donmai.us/original/dc/fe/dcfe825ea857757a414aec1910c7f0b1.jpg",
      bio: "Passionate about vibrant character art and magical aesthetics.",
      custom_tos: "Personal use only; commercial use requires extra license."
    },
  },
  {
    id: 2,
    title: "YCH - Stream Cover Artwork",
    description: "Eye-catching stream cover perfect for Twitch or YouTube branding.",
    details: "Delivered as high-resolution PNG with optional edits for layout adjustments.",
    price: 1550,
    monetization_rate: 1.75,
    commercial_rate: 2.3,
    image_url: "https://cdn.donmai.us/original/ec/26/ec2652f05ba6669dedff19d714c74c4d.jpg",
    category: "Illustration",
    status: "Open",
    is_new_offer: true,
    avgRating: 4.3,
    ratingCount: 95,
    created_at: new Date(),
    artist: {
      id: 15,
      username: "Plana",
      pfp_url: "https://cdn.donmai.us/original/dc/fe/dcfe825ea857757a414aec1910c7f0b1.jpg",
      bio: "Specializes in dynamic, vibrant art that pops on streams.",
      custom_tos: "Personal use; commercial requires additional licensing."
    },
  }
];

const server = express();

server.get('/', (req: Request, res: Response) => {
  res.send("nyallo!");
});


export const getItems = async (req: Request, res: Response) => {
  try {
    setTimeout(() => {
      res.status(200).json(item);
    }, 500);

  } catch (err) {
    console.error("err:", err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
}

export const getItemById = async (req: Request, res: Response) => {
  const id = parseInt(req.params.id);
  const foundItem = item.find(item => item.id === id);

  if (!foundItem) {
    return res.status(404).json({ message: "item not found" });
  }

  try {
    setTimeout(() => {
      res.status(200).json(foundItem);
    }, 500);

  } catch (err) {
    console.error("err:", err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
}

export default server;
