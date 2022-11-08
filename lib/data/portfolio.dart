import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';

class PortfolioData {
  final int? id;
  final String? title;
  final Color? color;
  final IconData? coinIcon;
  final int? coinAmount;
  final double? percentCoin;

  PortfolioData( {this.id, this.title, this.color,this.coinIcon,this.coinAmount,this.percentCoin});
}

// For demo list of service
List<PortfolioData> portfolio = [
  PortfolioData(
    id: 1,
    title: "Bitcoin",
    coinIcon: CryptoFontIcons.BTC,
    color: Color.fromARGB(255, 134, 191, 237),
    coinAmount: 5,
    percentCoin: 0.2,
  ),
  PortfolioData(
    id: 2,
    title: "ETH",
    coinIcon: CryptoFontIcons.ETH,
    color: Color(0xFF27496D).withOpacity(0.3),
    coinAmount: 4,
    percentCoin: 0.3,
  ),
  PortfolioData(
    id: 3,
    title: "DOGE",
    coinIcon: CryptoFontIcons.DOGE,
    color: Color(0xFF0C7B93).withOpacity(0.3),
    coinAmount: 2000,
    percentCoin: 0.35,
  ),
  PortfolioData(
    id: 4,
    title: "ERC",
    coinIcon: CryptoFontIcons.ERC,
    color: Color(0xFF00A8CC),
    coinAmount: 5000,
    percentCoin: 0.10,
  ),
];
