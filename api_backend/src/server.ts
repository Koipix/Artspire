import express, { Request, Response } from 'express';
import { ArtItemWithArtist } from './models/ArtItem';

const item: ArtItemWithArtist[] = [
  {
    id: 1,
    title: "YCH - Full Body Illustration",
    description: "lorem ipsum",
    details: "loremi impsumi",
    price: 3500,
    image_url: "https://danbooru.donmai.us/posts/10570730",
    category: "Illustration",
    status: "Open",
    is_new_offer: true,
    avgRating: 4.5,
    ratingCount: 103,
    created_at: new Date(),
    artist: {
      id: 25,
      username: "Arona",
      pfp_url: "https://cdn.donmai.us/original/dc/fe/dcfe825ea857757a414aec1910c7f0b1.jpg",
      bio: "your pretty princess",
      custom_tos: "bites"
    },
  },
  {
    id: 2,
    title: "YCH - Animated Stream Cover",
    description: "lorem ipsum",
    details: "loremi impsumi",
    price: 1500,
    image_url: "https://danbooru.donmai.us/posts/10570730",
    category: "Illustration",
    status: "Open",
    is_new_offer: true,
    avgRating: 4.2,
    ratingCount: 89,
    created_at: new Date(),
    artist: {
      id: 15,
      username: "Plana",
      pfp_url: "https://cdn.donmai.us/original/dc/fe/dcfe825ea857757a414aec1910c7f0b1.jpg",
      bio: "your pretty princess",
      custom_tos: "bites"
    },
  },
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
