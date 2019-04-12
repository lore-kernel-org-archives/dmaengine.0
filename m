Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,1/2] dmaengine: sh: rcar-dmac: With cyclic DMA residue 0 is valid
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Message-Id: <TYAPR01MB427170110F8A8D6822D17F83D8280@TYAPR01MB4271.jpnprd01.prod.outlook.com>
Date: Fri, 12 Apr 2019 08:33:58 +0000
To: "REE dirk.behme@de.bosch.com" <dirk.behme@de.bosch.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "niklas.soderlund+renesas@ragnatech.se" <niklas.soderlund+renesas@ragnatech.se>, "laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>, "Achim.Dahlhoff@de.bosch.com" <Achim.Dahlhoff@de.bosch.com>, "ylhuajnu@outlook.com" <ylhuajnu@outlook.com>, HIROYUKI YOKOYAMA <hiroyuki.yokoyama.vx@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <dmaengine.vger.kernel.org>

SGkgRGlyay1zYW4sCgo+IEZyb206IERpcmsgQmVobWUsIFNlbnQ6IEZyaWRheSwgQXByaWwgMTIs
IDIwMTkgMjoyOSBQTQo+IAo+IEhhdmluZyBhIGN5Y2xpYyBETUEsIGEgcmVzaWR1ZSAwIGlzIG5v
dCBhbiBpbmRpY2F0aW9uIG9mIGEgY29tcGxldGVkCj4gRE1BLiBJbiBjYXNlIG9mIGN5Y2xpYyBE
TUEgbWFrZSBzdXJlIHRoYXQgZG1hX3NldF9yZXNpZHVlKCkgaXMgY2FsbGVkCj4gYW5kIHdpdGgg
dGhpcyBhIHJlc2lkdWUgb2YgMCBpcyBmb3J3YXJkZWQgY29ycmVjdGx5IHRvIHRoZSBjYWxsZXIu
Cj4gCj4gRml4ZXM6IDM1NDRkMjg3ODgxNyAoImRtYWVuZ2luZTogcmNhci1kbWFjOiB1c2UgcmVz
dWx0IG9mIHVwZGF0ZWQgZ2V0X3Jlc2lkdWUgaW4gdHhfc3RhdHVzIikKPiBTaWduZWQtb2ZmLWJ5
OiBEaXJrIEJlaG1lIDxkaXJrLmJlaG1lQGRlLmJvc2NoLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBB
Y2hpbSBEYWhsaG9mZiA8QWNoaW0uRGFobGhvZmZAZGUuYm9zY2guY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IEhpcm95dWtpIFlva295YW1hIDxoaXJveXVraS55b2tveWFtYS52eEByZW5lc2FzLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBZYW8gTGlodWEgPHlsaHVham51QG91dGxvb2suY29tPgo+IENjOiA8
c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NC44Kwo+IC0tLQoKVGhhbmsgeW91IGZvciB0aGUg
cGF0Y2ghIFNpbmNlIGN5Y2xpYyB0cmFuc2ZlcnMgd2lsbCBub3Qgc3RvcCBldmVuIGlmCnRoZSBy
ZXNpZHVlIGlzIDAsIEkgYWdyZWUgdGhpcyBkcml2ZXIgc2hvdWxkIG5vdCByZXR1cm4gRE1BX0NP
TVBMRVRFCih0cmFuc2FjdGlvbiBjb21wbGV0ZWQpLiBTbywKClJldmlld2VkLWJ5OiBZb3NoaWhp
cm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+CgpCZXN0IHJlZ2Fy
ZHMsCllvc2hpaGlybyBTaGltb2RhCg==
