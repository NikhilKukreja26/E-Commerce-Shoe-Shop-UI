import 'package:flutter/material.dart';

import '../core/const.dart';

class ShoeModel {
  final String id;
  final String name;
  final double price;
  final String desc;
  final Color color;
  final String brand;
  final String imgPath;

  ShoeModel({
    this.id,
    this.name,
    this.price,
    this.desc,
    this.color,
    this.brand,
    this.imgPath,
  });

  static List<ShoeModel> list = [
    ShoeModel(
      id: 's1',
      name: "Nike Air Jordan 1 Retro High",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 184,
      color: AppColors.blueColor,
      brand: "Nike",
      imgPath: "assets/2.png",
    ),
    ShoeModel(
      id: 's2',
      name: "Converse X OPI Chuck Taylor",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 123,
      color: AppColors.yellowColor,
      brand: "Converse",
      imgPath: "assets/1.png",
    ),
    ShoeModel(
      id: 's3',
      name: "Nike Air Jordan 1 Retro High",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 135,
      color: AppColors.redColor,
      brand: "Nike",
      imgPath: "assets/3.png",
    ),
    ShoeModel(
      id: 's4',
      name: "Nike Air Jordan 1 Retro High",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 184,
      color: AppColors.blueColor,
      brand: "Nike",
      imgPath: "assets/2.png",
    ),
    ShoeModel(
      id: 's5',
      name: "Converse X OPI Chuck Taylor",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 123,
      color: AppColors.yellowColor,
      brand: "Converse",
      imgPath: "assets/1.png",
    ),
    ShoeModel(
      id: 's6',
      name: "Nike Air Jordan 1 Retro High",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 135,
      color: AppColors.redColor,
      brand: "Nike",
      imgPath: "assets/3.png",
    ),
    ShoeModel(
      id: 's7',
      name: "Nike Air Jordan 1 Retro High",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 184,
      color: AppColors.blueColor,
      brand: "Nike",
      imgPath: "assets/2.png",
    ),
    ShoeModel(
      id: 's8',
      name: "Converse X OPI Chuck Taylor",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 123,
      color: AppColors.yellowColor,
      brand: "Converse",
      imgPath: "assets/1.png",
    ),
  ];
}
