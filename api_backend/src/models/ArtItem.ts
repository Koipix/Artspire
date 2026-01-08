import server, { Artist } from './Artist.ts';

export interface ArtItem {
  id: numer;
  artist_id: number;
  title: string;
  description: string | null;
  details: string | null;
  image_url: string;
  price: number;
  category: string;
  status: string;
  is_new_offer: boolean;
  created_at: Date;
}

export interface ArtItemWithArtist extends Omit<ArtItem, 'artist_id'> {
  artist: Artist;
}
