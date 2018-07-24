Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,11/18] dmaengine: dma-jz4780: Add missing residue DTC mask
From: Vinod Koul <vkoul@kernel.org>
Message-Id: <20180724133853.GH3661@vkoul-mobl>
Date: Tue, 24 Jul 2018 19:08:53 +0530
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-ID: <dmaengine.vger.kernel.org>

T24gMjEtMDctMTgsIDEzOjA2LCBQYXVsIENlcmN1ZWlsIHdyb3RlOgo+IEZyb206IERhbmllbCBT
aWxzYnkgPGRhbnNpbHNieUBnbWFpbC5jb20+Cj4gCj4gVGhlICdkdGMnIHdvcmQgaW4ganogRE1B
IGRlc2NyaXB0b3JzIGNvbnRhaW5zIHR3byBmaWVsZHM6IFRoZQo+IGxvd2VzdCAyNCBiaXRzIGFy
ZSB0aGUgdHJhbnNmZXIgY291bnQsIGFuZCB1cHBlciA4IGJpdHMgYXJlIHRoZSBET0EKPiBvZmZz
ZXQgdG8gbmV4dCBkZXNjcmlwdG9yLiBUaGUgdXBwZXIgOCBiaXRzIGFyZSBub3cgY29ycmVjdGx5
IG1hc2tlZAo+IG9mZiB3aGVuIGNvbXB1dGluZyByZXNpZHVlIGluIGp6NDc4MF9kbWFfZGVzY19y
ZXNpZHVlKCkuIE5vdGUgdGhhdAo+IHJlYWRzIG9mIHRoZSBEVENuIGhhcmR3YXJlIHJlZyBhcmUg
YXV0b21hdGljYWxseSBtYXNrZWQgdGhpcyB3YXkuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFNpbHNieSA8ZGFuc2lsc2J5QGdtYWlsLmNvbT4KPiBUZXN0ZWQtYnk6IE1hdGhpZXUgTWFsYXRl
cnJlIDxtYWxhdEBkZWJpYW4ub3JnPgoKVGhpcyBuZWVkcyB5b3VyIHMtby1iLiBQbGVhc2Ugc2Vl
IERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0CgpJIHRoaW5rIFJh
bmR5IGRpZCBmbGFnIHRoaXMgb25lIHNvbWUgb3RoZXIgcGF0Y2ggYXMgd2VsbC4gQWxsIHRoZQpw
YXRjaGVzIG5lZWQgdG8gYmUgc2lnbmVkIG9mZiBieSBzZW5kZXIgYXMgd2VsbAo=
