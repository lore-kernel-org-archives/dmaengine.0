Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,05/13] mtd: rawnand: marvell: remove the dmaengine compat need
From: Miquel Raynal <miquel.raynal@bootlin.com>
Message-Id: <20180524113006.3d5f393e@xps13>
Date: Thu, 24 May 2018 11:30:06 +0200
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, alsa-devel@alsa-project.org, netdev@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

SGkgUm9iZXJ0LAoKT24gVGh1LCAyNCBNYXkgMjAxOCAwOTowNjo1NSArMDIwMCwgUm9iZXJ0IEph
cnptaWsKPHJvYmVydC5qYXJ6bWlrQGZyZWUuZnI+IHdyb3RlOgoKPiBBcyB0aGUgcHhhIGFyY2hp
dGVjdHVyZSBzd2l0Y2hlZCB0b3dhcmRzIHRoZSBkbWFlbmdpbmUgc2xhdmUgbWFwLCB0aGUKPiBv
bGQgY29tcGF0aWJpbGl0eSBtZWNoYW5pc20gdG8gYWNxdWlyZSB0aGUgZG1hIHJlcXVlc3RvciBs
aW5lIG51bWJlciBhbmQKPiBwcmlvcml0eSBhcmUgbm90IG5lZWRlZCBhbnltb3JlLgo+IAo+IFRo
aXMgcGF0Y2ggc2ltcGxpZmllcyB0aGUgZG1hIHJlc291cmNlIGFjcXVpc2l0aW9uLCB1c2luZyB0
aGUgbW9yZQo+IGdlbmVyaWMgZnVuY3Rpb24gZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbCgpLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFNpZ25lZC1vZmYtYnk6IERhbmllbCBNYWNrIDxkYW5pZWxAem9u
cXVlLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgSmFyem1payA8cm9iZXJ0LmphcnptaWtA
ZnJlZS5mcj4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgfCAx
NyArLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE2
IGRlbGV0aW9ucygtKQo+IAoKQWNrZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhp
cyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBkbWFlbmdpbmUiIGluCnRoZSBib2R5
IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21v
IGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=
