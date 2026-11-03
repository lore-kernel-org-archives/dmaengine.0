Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793728629;
	b=ge6I1XrV9Q18gyXbzWd4XOVW4TTQ15syKWqfcMiJRm3CY8gty2tzGIrOYU6NQctXV+qJ
	 3vlkU0qdTh7F0Es0HBKyj7DWgAH49D4cRNq83ITq1fVqMDbDxWS5fx1hlyeZVdHzPy09r
	 vA+DGC05jwc7yCGDUhsIyFG3zv9CI7TA6fImN2cLqSiiMc8YrkzlZLWUJob+X7585yxuB
	 ZDbTNRAJvVKIl/jsSmA4t3svyH4tm9QlCB7EcMnxNqMfomI20jTzoV0R8ofs+rFSxqFML
	 3qqYi6w2je2lN5Vr1KRd2zYUPFh4sfhuwny3JBDdSh+qSkWuF/WgBVGL2yp2J8wrV6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728629;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8peqm2HSFR4zGLLwd9ssjAivGBEEepONaNHw6ZvoQYw=;
	b=RCeLnvSkELcuu8vkSySrNK1sY47d0tpURkAaIcAttJaPh+XZWtLxhEqMt5Xnhk1ofGSa
	 HeOQJNNcetV3WlL1unGvNeN8YAr2K3qv6DJmSpoOdo2/Z5bwpA6xUNf4CI98fG7yZVsNc
	 JVHdHnGXWI1lOOEnU3U89Qjekzlnq+0PaTKjq4Ja2DL9Kw6kpcXg3+R1QFT3eBhcdCshQ
	 behFlaZGBClxAovlVbPxRu3OV2I8vj5uF8baBb82glyjrP0XZl76qqhyhfgayscHJMbuz
	 0pwV61H+struXT3Ta2ik/9yN5GrSYLjSe3gZU0UFynFxKJXVK0l484bX9GtDLLauGbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=FFnqvgHk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.34
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6390C606A31B;
	Tue,  3 Nov 2026 17:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6390C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=FFnqvgHk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRMcphuG8/71wZCjKM6rsLIsldntwvDmpB4xcKN9M9+Wg08kjX0qV6m37zoCqoBab9u7EkyaPwMVYt1dwCsCx5FTsRce4jglhq9ZpFLAa4IX0ivUNUUAhiJdIFgkmNFISUVKbGXSHEdJXxZym48g8ul6MX1rRsL71+dKr47e1l1JBQWbBlZw75K82YYKmLa+dkoZ/71a+m1k0qnWssY4x8jRGOyRUjRydIZb6WCmUH0JidjENMPtMPm9iPwe65O9OG8GfWQ6lR4Aw+k2vecBPwiVAorCPHrgmucqCxz3hY1dSYcFZE6CoB+vjQLIZ46c32HXN9osxgR4gRbbYBexwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8peqm2HSFR4zGLLwd9ssjAivGBEEepONaNHw6ZvoQYw=;
 b=U0Oz6DgIJLpVbcrZoeKbuQQeqeAUOM6EasCsav/2i0l1o7D5yOjNOKYVwCbhpXDiPKl8PPvtkSW/pV7NEbBXPrygDTYPDPTmXE18fqlKlbPHTU8MhBSmFw4jgm435ML4YcW6BTXNskWadfiGm66HP+tE0rBwS/HvJNt4gSb5ZAW6q+yNFndEtyFwKTBMQ5RCtKEyhM60WDddvzSNNPHZcwRtmxAUDUozRnafcseHLh4M+i2x1XdLToeitS0xiKJP2qFHKIAgM5QzEANtpe0Ut/0KykcYA+b+oexEp89TsJcVjxenBfOpjOLodVqTmsqmw5ujhmXKrAnvyQmVGY5QRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8peqm2HSFR4zGLLwd9ssjAivGBEEepONaNHw6ZvoQYw=;
 b=FFnqvgHk5QMYOrK+VHtblZQzk5U/9tL0bIos/GblJG2cEbpVQnSMpUAc7UMQVGvwuIDukjUvdnEKrNEuoMkvs985lHIsCOd0bW6II1oASjAjhJze3ceHXNiwE9ILbBdgMb4TB6rCgS1x0Zc3d7zhF/+olFMB0/4ucYmiccBcdxM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSOPR01MB17964.jpnprd01.prod.outlook.com (2603:1096:604:47a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:57:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:57:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Prabhakar
	<prabhakar.csengg+renesas@gmail.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [RFC PATCH 0/3] soc: renesas: Add address extension support for
 RZ/V2H
Thread-Topic: [RFC PATCH 0/3] soc: renesas: Add address extension support for
 RZ/V2H
Thread-Index: AQHdQJKoDfwPpT6tL06OdyzUT7k3x7cc9gcA
Date: Tue, 3 Nov 2026 17:57:03 +0000
Message-ID:
 <TY3PR01MB113468E6E7CABC5A0487A352A86692@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSOPR01MB17964:EE_
x-ms-office365-filtering-correlation-id: adbba5af-f940-442a-8d2d-08df39d3ddfe
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|38070700021|56012099006|261022105027099003|5023799004|11063799006|261009223027099003|261009223327099003|261009221727099003|261009220027099003|261021121427099003|261009221227099003|261028144727099003|261102123227099003|261022113327099003|261022075727099003|261021123027099003|261022115727099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 02I9iWkreFIzLwJX7iS9KYLycoYXCrgFkhI66xLTVw0s0P0YFEzrnXbLyPomhw3t0nCespfSZHLA7dtgwB5zeO4yMSd9PsWg36oC+HBod4invzL/rJ6DLPndcmBm9bmJFMUedErSAXjBU04EOCnlhuC0GS124gAKrhhcXn0LxrlQunPEwlKjTrpUrkL61FbR3x+Ar+9RTeJhQapjOXjnXwJAVqZpyHVU7N+ozTClffFvlggHVW110nNZC+Sph3LYEGVxtDUxhCpBPrgMtu1pX/6q4pRf+wVLVr9izm6B69jY0yauhohwoPom96yOlIZ8rcXwVwMNczyCir8YOtgaUh12cZOuvZdLRsptcec22K2iti2RIOT/ft7n79f+HHwMq21v6FeRKyhr04ISFCYMStiqASiSDZ7/1qhstWTNacCFJlc6Du3JewGbMdw3viyCDh+/JLKNxlndjz8pzSw6d1wBjleXg++Q/iiryx4at9x+c7AVGMR2CWVe1oTA8R2Cjyqv96fcMWJkLyTHu5h6peg0xOKCZDkbUj2vfmqE+IjsHfFHqt9Ul2o/mWZzmHGjGtw6ygXVxf9aTXqCPs241Qr4cPAEehxyU00/f4YkeP6HftAYuV4xWRw4VHWYyl8GE4+cE4lqwN2QRCHGL5JxRCokm62MztYlMtcZ0KEmGWA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(38070700021)(56012099006)(261022105027099003)(5023799004)(11063799006)(261009223027099003)(261009223327099003)(261009221727099003)(261009220027099003)(261021121427099003)(261009221227099003)(261028144727099003)(261102123227099003)(261022113327099003)(261022075727099003)(261021123027099003)(261022115727099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KneqTfF5MsH6VpwGBhW2sseABjnsx2zCNEZiGVcmTBcliCZleS6pVUAqAcqi?=
 =?us-ascii?Q?Z89jB0XdkcTbtpq85dDMtd/UZbrQXoNu0Blf8oeQVNufWUeUZcw3G+5196n/?=
 =?us-ascii?Q?JPCm5fVa0GOpyRWZ4VdnFonlDSa6AzUNRry0CyKcaq/70sr3VlaEQs2kXaXV?=
 =?us-ascii?Q?Y8wH10bulcKBSWEKqAm5rEfC/PXtK4ImFfHekF72l3/BUeqRMtJ8lCog6+EM?=
 =?us-ascii?Q?jhJHE9t+eqKQW4wRfcNZWmDfyLq+HX+Z4cq5optGRJ8IpM/xQQkIldVVSkHS?=
 =?us-ascii?Q?Zj2TVgiyTgXyFPv//wKO/cxuT/XeCRqBGiz4TNLeKclSdEX36a5Jjs+CJPrz?=
 =?us-ascii?Q?7YvOjhGGrPlZhj5TH/0D+D3mn7B202pVnXQ6ssKgdzvKISwp9oWvZIcntlyC?=
 =?us-ascii?Q?ZDIulsxW1HmP8DeeIBgXoPO1eF74na/6SKN/UpQtmxrUK6EIMGEoDw7tXtaN?=
 =?us-ascii?Q?WgHuxHjrGGniBZQZcFElXye1qKq8SdZiGEyZoYvei/Oo3MtqJeXbyzlA3fuN?=
 =?us-ascii?Q?S/xBHAgRSeqeRjBpG7459ZM8GtTcfu9EGtk7A7Ss3f7IWl6/Oy+GqFki9NEm?=
 =?us-ascii?Q?XllaLVCOjkCVPvGwnVM5X19USPO2dOb1FCCG4DPxS/4N3ChvASRX4IN0a+ri?=
 =?us-ascii?Q?55i0kOA6iJ/e7VkAuxlemImzY5I+GEBi49vHog+ED4i8aMAey3SilzsmVyt3?=
 =?us-ascii?Q?YGFMMOnYtG4WqOgXcTIq/ocA2YcqNrr8XEXsxHLE0a3cmuURwCMedi63yxbB?=
 =?us-ascii?Q?Wg4vhUHre4SRqrfmirTRDDwOJf40WHEwaRUnjUIu0HDzgEH+sV7p1D1pw7yu?=
 =?us-ascii?Q?FoKn+AwJgOeVckL4ifyJDW8QEN0PuBbHITMuwF5Al5RMjVQ9v6cs/U45fT5N?=
 =?us-ascii?Q?klssba4o0EmLvSXUV8izgNIU5JVJcR+Jn+N5KwA2danjiAuDURqRQpZsKsEY?=
 =?us-ascii?Q?Frt4hu9qkHmc6crvKEzKI3/lc2mvlYQGWyvr18iXkqzliPkTWizLegmsf+cy?=
 =?us-ascii?Q?apryHomrX8n16M3hssda9Gqzq5MR4XtbiuQPK1eljwKbblIQXVbrf1Or1Atz?=
 =?us-ascii?Q?nGLgBZedVUo0lgi/0dhmsc5SbJkB1YmvMdJH/bH2CBGLFBU88It/E5hHGHIP?=
 =?us-ascii?Q?l5GBmIPvzi1sPCPUacQhabFm5VKy5/kB+og5Y5G3RJ8vHEKjRuyEOIOJrjmk?=
 =?us-ascii?Q?YV1PGjlasJlC1YyeDUM7bR46a1qHxR3nia+SfZ8znMHSa+geV186eGLuzrPz?=
 =?us-ascii?Q?UOUzikyof3aZrTWOsGKDfeMEW/jlLaGJb3AlRG9tzvXjXHfFWFxSA2wETPLH?=
 =?us-ascii?Q?3ybohI9j/cQD4hmji6FQsGzytcXS8M6HzQMO+tt1pQSvbDM1St+VJJs2cU44?=
 =?us-ascii?Q?e2CC8ivAuuJH+DVXnLDULaLPyNQOkkEeCU4t6lq+Od4gmr+zgTF+7vSD5wxd?=
 =?us-ascii?Q?mO0UCzvkgnyoagy0r3CbLfBNfoyRT3QkZOhZuUwHvCzxwOMKr6UKGfvlhCvP?=
 =?us-ascii?Q?0nZqTrmmypBa7S3XhIhIrGwgNrotA0K0E2he4FCC3/ZS0qb3eqGvFM1PjkYP?=
 =?us-ascii?Q?nvBJY1J/9SwgkzeqfWe+yD34bEqpXrdNDSox78LTQbEemmXCDQ6JgiljzDk9?=
 =?us-ascii?Q?RQMw8SXEdihTlOfeBJ3mkT6ybdvgJtc+dTE1L3AY1Yntk72w+wjYv8n9Whbb?=
 =?us-ascii?Q?eLxtCUZX+PqNA8yZuCo7dxzKRdj+5qIlxxuz32mhoQeuHkq8vdpTR6ytKLMR?=
 =?us-ascii?Q?7V+6PllORA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adbba5af-f940-442a-8d2d-08df39d3ddfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:57:03.5118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UeRcTX/1bLwokLXOHwA7qh4n760F65HigoOPv2eWt8TmtmtsNjiryLIdCPvHgbDMk7JKBIWFsQB7fEZit8aeoOPNB2EAwIpqeZeT3OgzhtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB17964

Hi All,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 09 September 2026 20:37
> Subject: [RFC PATCH 0/3] soc: renesas: Add address extension support for =
RZ/V2H
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Hi all,
>=20
> This series adds support for the SYS_AOF (Address Offset Function) addres=
s extension mechanism on RZ/V2H,
> and enables it for the SDHI internal DMAC so SD/eMMC DMA buffers are no l=
onger confined to the low 4 GiB
> of physical memory.
>=20
> Background
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> RZ/V2H contains bus masters (SDHI, USB, GBETH, VCD, DSI, LCDC, ISP, DMAC,=
 ...) that can only generate a
> 32-bit address on their own bus. The SYS controller's SYS_AOFn registers =
let bits [31:30] of the address
> such a master issues select one of four independently configurable 6-bit =
fields; the selected field
> supplies the corresponding upper bits ([34:30] or [35:30]) actually drive=
n onto the AXI interconnect,
> with bits [29:0] passed straight through. This splits each master's nativ=
e 4 GiB space into four
> relocatable 1 GiB windows, letting it reach a 35-bit (DDR0/DDR1) or 36-bi=
t (+PCIe0/
> PCIe1) physical address space. See RZ/V2H Group Hardware User's Manual, F=
igure 1.7-2 and Sections 1.7.3.2
> and 4.3.3.2.88-90, reproduced here in text form:
>=20
>                      +--------------------+
>                      |       Master       |
>                      |  32-bit address    |
>                      |      [31:0]        |
>                      +----------+---------+
>                                 |
>               +-----------------+-------------------+
>               | bits [31:30]                        | bits [29:0]
>               | select field                        | passed through
>               v                                     |
>     +---------------------------------+             |
>     |         SYS_AOFn register       |             |
>     |  +------+------+------+------+  |             |
>     |  | Reg3 | Reg2 | Reg1 | Reg0 |  |             |
>     |  |  11  |  10  |  01  |  00  |  |             |
>     |  +--+---+--+---+--+---+--+---+  |             |
>     +-----|------|------|------|------+             |
>           +------+------+------+ supplies           |
>                      |    [35:30] or [34:30]        |
>                      v                              v
>               +-------------------------------------+
>               |          AXI interconnect           |
>               |        35- or 36-bit address        |
>               +--------------------+----------------+
>                                    |
>                                    v
>      +-----------------------------------------------------+
>      |               Physical address space                |
>      |  F_FFFF_FFFFh +-----------------------------------+ |
>      |               |          PCIe1 - 23 GiB           | |
>      |  A_4000_0000h +-----------------------------------+ |
>      |               |          PCIe0 - 24 GiB           | |
>      |  4_4000_0000h +-----------------------------------+ |
>      |               |           DDR1 - 8 GiB            | |
>      |  2_4000_0000h +-----------------------------------+ |
>      |               |           DDR0 - 8 GiB            | |
>      |  0_4000_0000h +-----------------------------------+ |
>      |               |  SRAM, peripheral, xSPI - 1 GiB   | |
>      |  0_0000_0000h +-----------------------------------+ |
>      +-----------------------------------------------------+
>=20
>      Four 1 GiB windows, each independently redirectable to
>      any 1 GiB-aligned target above; 35-bit-limited masters
>      must keep bit [5] of every field clear (1.7.3.2.1).
>=20
> In case the image isnt formatted correctly please refer the link
> https://raw.githubusercontent.com/prabhakarlad/img/refs/heads/main/Screen=
shot%202026-08-12%20162004.png
>=20
> Without this, SDHI (and other masters in the same category) are limited t=
o buffers in the low 4 GiB.
>=20
> Approach
> =3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Rather than hardcoding SYS_AOFn programming per board, this series derive=
s it from the devicetree dma-
> ranges property already used to describe DMA address translation:
>=20
>  - Patch 1 adds generic AOF parsing/programming infrastructure to
>    the rz-sysc driver. Each SoC lists its AOF-capable masters as
>    (MMIO base, SYS_AOFn index, address width) tuples; at probe time,
>    the driver walks "simple-bus" wrapper nodes carrying a dma-ranges
>    property, matches the wrapped device against that table by MMIO
>    base, and programs the corresponding SYS_AOFn fields directly
>    from the dma-ranges translation. Devices with status =3D "disabled"
>    are skipped. Malformed or out-of-range entries (misaligned,
>    exceeding the master's own 4 GiB space, or requiring bit [5] on a
>    35-bit-limited master) are rejected.
>=20
>  - Patch 2 moves the SDHI nodes in r9a09g057.dtsi into per-instance
>    simple-bus wrapper nodes with a default, no-op (DDR0-targeting)
>    dma-ranges -- no functional change for boards that don't further
>    override it.
>=20
>  - Patch 3 demonstrates a non-default window on the RZ/V2H EVK:
>    SDHI1's dma-ranges is pointed at an 8-12 GiB DDR1 window, backed
>    by a restricted-dma-pool reserved-memory region so buffers handed
>    to SDHI1 are guaranteed to physically land inside the range the
>    programmed SYS_AOF17 fields can actually reach.
>=20
> Boards that do not override an SDHI instance's dma-ranges see no function=
al change: the default wrapper
> mapping added in patch 3 is an identity remap onto DDR0's native address.
>=20
> Trade-offs
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> - Attaching a restricted-dma-pool to a device makes every DMA transfer fo=
r that device bounce
> unconditionally (is_swiotlb_force_bounce()), regardless of whether the bu=
ffer's physical address would
> otherwise have been directly usable.
> - Each master will require a restricted-dma-pool.
>=20
> Testing
> =3D=3D=3D=3D=3D=3D=3D
>=20
> Tested on the RZ/V2H EVK (r9a09g057h44-rzv2h-evk) with SDHI1 remapped to =
an 8-12 GiB DDR1 window, running
> repeated large-file dd read/write and mmc_test against an SD card, with n=
o functional errors observed.
> While running mmc_test a loss of ~4% was seen for read/write tests as the=
 mmc_test module allocated the
> memory using GFP_DMA flag.
>=20
> This series does not yet cover the remaining AOF-capable masters (USB, GB=
ETH, VCD/DSI/LCDC/ISP, DMAC
> channels).
>=20
> Request for feedback
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The ~4% loss above comes from restricted-dma-pool's unconditional bounce =
policy
> (is_swiotlb_force_bounce()): every SDHI transfer is copied through the po=
ol, even when the source
> buffer's physical address would already have been usable without any copy=
 at all.
> This is a direct consequence of using restricted-dma-pool as the correctn=
ess mechanism for a device whose
> real addressing constraint doesn't map onto the flat dma_mask/dma-ranges =
model the generic DMA layer
> otherwise assumes.
>=20
> Before optimizing this further, I'd like inputs on whether restricted-dma=
-pool is the right tool here.
> Suggestions and pointers to prior art for similar SoC address-extension/a=
perture hardware would be very
> welcome.

On RZ/G3E, I haven't used restricted-dma-pool.

With u-boot configuring

mw 0x10430540 0x03020104
mw 0x10430544 0x03020104
mw 0x10430548 0x03020104

and with the DTS change below, I see performance improvement on eMMC/SDHI i=
nterface on RZ/G3E.
This avoids swiotlb during DMA transfer as all memory is DMA capable.

+       sdhi_bus: sdhi-bus {
+               compatible =3D "simple-bus";
+               #address-cells =3D <2>;
+               #size-cells =3D <2>;
+               ranges;
+               dma-ranges =3D <0x0 0x48000000  0x0 0x48000000  0x0 0xb8000=
000>,
+                    <0x0 0x00000000  0x1 0x00000000  0x0 0x40000000>;

then

cat /sys/block/mmcblk0/queue/max_hw_sectors_kb
4194303

This results in performance boost with mmc_test

eMMC (HS200 Mode)

Read: 182 MB/s vs 138 MB/s(without address extension)
Write : 135 MB/s vs 58 MB/s

SDR104:

Read: 95 MB/s vs 88 MB/s
Write: 88 MB/s vs 40 MB/se

Cheers,
Biju

>=20
> Thanks for reviewing.
>=20
> Cheers,
> Prabhakar
>=20
> Lad Prabhakar (3):
>   soc: renesas: rz-sysc: Configure AOF registers from dma-ranges
>   arm64: dts: renesas: r9a09g057: Move SDHI nodes into bus nodes
>   arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Move SDHI1 dma range from
>     8-12 GiB
>=20
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 123 +++++++++++-------
>  .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  16 +++
>  drivers/soc/renesas/r9a09g057-sys.c           |   9 ++
>  drivers/soc/renesas/rz-sysc.c                 | 118 +++++++++++++++++
>  drivers/soc/renesas/rz-sysc.h                 |  22 ++++
>  5 files changed, 240 insertions(+), 48 deletions(-)
>=20
> --
> 2.55.0

