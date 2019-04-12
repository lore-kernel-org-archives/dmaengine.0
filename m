Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,2/2] dmaengine: sh: rcar-dmac: Fix glitch in dmaengine_tx_status
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Message-Id: <TYAPR01MB4271FC724A8DAEFF0B69FF16D8280@TYAPR01MB4271.jpnprd01.prod.outlook.com>
Date: Fri, 12 Apr 2019 08:52:39 +0000
To: "REE dirk.behme@de.bosch.com" <dirk.behme@de.bosch.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "niklas.soderlund+renesas@ragnatech.se" <niklas.soderlund+renesas@ragnatech.se>, "laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>, "Achim.Dahlhoff@de.bosch.com" <Achim.Dahlhoff@de.bosch.com>, "ylhuajnu@outlook.com" <ylhuajnu@outlook.com>, HIROYUKI YOKOYAMA <hiroyuki.yokoyama.vx@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <dmaengine.vger.kernel.org>

SGkgRGlyay1zYW4sCgo+IEZyb206IERpcmsgQmVobWUsIFNlbnQ6IEZyaWRheSwgQXByaWwgMTIs
IDIwMTkgMjoyOSBQTQo+IAo+IEZyb206IEFjaGltIERhaGxob2ZmIDxBY2hpbS5EYWhsaG9mZkBk
ZS5ib3NjaC5jb20+Cj4gCj4gVGhlIHR4X3N0YXR1cyBwb2xsIGluIHRoZSByY2FyX2RtYWMgZHJp
dmVyIHJlYWRzIHRoZSBzdGF0dXMgcmVnaXN0ZXIKPiB3aGljaCBpbmRpY2F0ZXMgd2hpY2ggY2h1
bmsgaXMgYnVzeSAoRE1BQ0hDUkIpLiBBZnRlcndhcmRzIHRoZSBwb2ludAo+IGluc2lkZSB0aGUg
Y2h1bmsgaXMgcmVhZCBmcm9tIERNQVRDUkIuIEl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlIGNodW5r
Cj4gaGFzIGNoYW5nZWQgYmV0d2VlbiB0aGUgdHdvIHJlYWRzLiBUaGUgcmVzdWx0IGlzIGEgbm9u
LW1vbm90b25vdXMKPiBpbmNyZWFzZSBvZiB0aGUgcmVzaWR1ZS4gRml4IHRoaXMgYnkgaW50cm9k
dWNpbmcgYSAnc2FmZSByZWFkJyBsb2dpYy4KPiAKPiBGaXhlczogNzNhNDdiZDBkYTY2ICgiZG1h
ZW5naW5lOiByY2FyLWRtYWM6IHVzZSBUQ1JCIGluc3RlYWQgb2YgVENSIGZvciByZXNpZHVlIikK
CkkgZ3Vlc3MgdGhpcyBkcml2ZXIgaGFzIHRoaXMgaXNzdWUgcG90ZW5jaWFsbHkgZnJvbSBwcmV2
aW91cyBvZiB0aGUgY29tbWl0CihtYXliZSBjb21taXQgY2NhZGVlOWIxZTkgKCJkbWFlbmdpbmU6
IHJjYXItZG1hYzogSW1wbGVtZW50IHN1cHBvcnQgZm9yIGhhcmR3YXJlIGRlc2NyaXB0b3IgbGlz
dHMiPykuCgpCdXQsIHRoaXMgcGF0Y2ggc2VlbXMgZ29vZCB0byBmaXggdGhlIGlzc3VlLgpTbywK
ClJldmlld2VkLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVu
ZXNhcy5jb20+CgpCZXN0IHJlZ2FyZHMsCllvc2hpaGlybyBTaGltb2RhCg==
