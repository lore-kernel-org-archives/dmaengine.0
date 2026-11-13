Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.78
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794604804;
	b=3AcJuwXm8/miZYa1k/1q+zSycjbY5S38+AMI49emOWC3eLkOcnXacSDzs1whrZGVBKc1
	 Z31oziqPzTstVvnH8qGfKmTbwdQS4fFBVhD/SkmC1EEBDi8jO0cXIvDH3RUAb2GyQEFTX
	 JWO4zV8+lwM8oStgF6N8OUPyvE8MPT86qCLse1RikMA3MrS/DFyaxNqD6N1DlEGspfWF8
	 9CLtazu54aoA+c9a12iiqBJX77oUn8QqPlugt6XQviy2XKtANYVKxYYBhRMQsU3/mhAf4
	 d7FLGbvZNWz8FS6wcDs+2m0l6I25MJlvkyL11JU7c4D3UCBr6cQCpakXA+lq0QRYRWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604804;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
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
	bh=N4F/k/aISYCN1exZkWKm7aqK5VMzNONGdLSKEySBuPM=;
	b=MowAnV4r/lxz2H4tar/Te60fABism52oz3BAMoF7TiZFkjJNDnFowrTa0ApQpHje3iPA
	 roEof7N3w5vBahX/yk57oeh4Rbo2vRHqFPnRhftzAWXQk+yard1LdeXYD384i6Cbw83Qr
	 xLrQioldMaip+/0+1z1D/WKNbYmkar9fZDpgZiCTgSt6WUjLvr4mqga4fOLAfjfnJ3rWO
	 AdqiACqKSU3s2jzqZynAmyX3vOobxUn0GB9/9sdiVZ40CJE2oglw6SpIClWbmtVIFoaeO
	 E3/G/a3WOBhjxONFbO/VmO3VoF+wnDyafplTgeqWfHUklwpNM9+QeLn+SyEfGv/XbRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=accuratesound.ca;
	spf=pass smtp.mailfrom=accuratesound.ca;
	dkim=pass header.d=NETORG5777562.onmicrosoft.com header.i=@NETORG5777562.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NETORG5777562-onmicrosoft-com header.b=KmEXYCfZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.78
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022078.outbound.protection.outlook.com [40.107.193.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1671606A330
	for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 21:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1671606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=accuratesound.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=accuratesound.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5777562.onmicrosoft.com header.i=@NETORG5777562.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NETORG5777562-onmicrosoft-com header.b=KmEXYCfZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNmgJoD8+JYEAmTbTTXF55/ukYhpEeyzb+6vnoxP/gBWvpSUKxW+7saBSD6l4c4CJU001bxRYz2p71fDp5SxKDTqj5WO8Wh+HuCeCCfWfWElvTaLMbHN/zFpVF0jWOuJVSM7CVp2wzLsqHI8vuo2/0YfuTf6weL35FCkG4IjS76O/yK8XVZXy64A7sAVQhG8qurrikmdnsjUEO2rKxmsG99Sijgda39noAJFshJjfOYs4SJ/8ewueirlwSw3226ybK4J6ktP9tPBWKOeOROzUUx/ewmvxn23qDJRulQJBl5Gn+zLL3rez0T/7EPdnwlov0YePrer0ueS4xqq8Y7w0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4F/k/aISYCN1exZkWKm7aqK5VMzNONGdLSKEySBuPM=;
 b=kVMHPgm5MqWGvIkd0BWO2RmRAe+K+mk9hveMzBrTPYjStmm0GNDo26uRS6EJ/YUQdsz4j9f7Sw5R+LJWPBmG5bqCvuMruFP7PzTfWxcNDm316Vs4FDMM75RSvX0M5ddm8yP+NmPdCt85TXPpZjhaXcd6dsfaTXQwoCBZkEdRVyNw/09RKK+4vW7LE355PMrQOJGXfQq+aNq/JE6P5TJ/ajqJgEzcYFqj2JEzEbyUR9UbRh+xlWD8Jpp8OczYVPyPbjM0ohMKiF6I6WWHAlDMbsfv5IPDR3DLr7mi0JYYPW6zJ9y0qGCwIdY5EnidQbQF+H199vZUecQIvImGgPEWlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=accuratesound.ca; dmarc=pass action=none
 header.from=accuratesound.ca; dkim=pass header.d=accuratesound.ca; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5777562.onmicrosoft.com; s=selector1-NETORG5777562-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4F/k/aISYCN1exZkWKm7aqK5VMzNONGdLSKEySBuPM=;
 b=KmEXYCfZKJpynL5fQEOvriuuoZOqODJ93jvAu7Es+hZsvRcqfQy7YWTFiy3l8GhbVULKF98j2ImkaLdepqFBIuhyBQhIkVymWkvArP8omEXUHc9NK32e30ft+wzTi5nLWodiEsvMSiAGudTIRbayJZ9comSEfownp8DncPMZra8=
Received: from YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1c2::21) by YT2PR01MB10573.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ed::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 21:19:58 +0000
Received: from YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::bde:6c2d:c5a7:18db]) by YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::bde:6c2d:c5a7:18db%5]) with mapi id 15.21.0615.008; Fri, 13 Nov 2026
 21:19:58 +0000
From: Mitch Barnett <mitch@accuratesound.ca>
To: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
Subject: [RFC] dmaengine: dw-axi-dmac: cyclic alias lifetime and failed-stop
 teardown (RPi 5)
Thread-Topic: [RFC] dmaengine: dw-axi-dmac: cyclic alias lifetime and
 failed-stop teardown (RPi 5)
Thread-Index: AQHdc7H3GV4hELcr/0KKcQN7qVSMSw==
Date: Fri, 13 Nov 2026 21:19:58 +0000
Message-ID:
 <YT6PR01MB63707769A78186335441B06879D87F2@YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=accuratesound.ca;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT6PR01MB637077:EE_|YT2PR01MB10573:EE_
x-ms-office365-filtering-correlation-id: a0f19167-bf3b-4065-1003-08df41cbdecb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|7055299009|10067099003|56012099006|261022105027099003|261026130827099003|261022113327099003|261028144727099003|261026121527099003|261021130227099003|261021121427099003|261022075727099003|261021123027099003|261021135927099003|261026140227099003|261102123227099003|261022115727099003|261009223027099003|6133799003|18002099003|83080400003;
x-microsoft-antispam-message-info:
 V+wnTURinh4g54LbxBs4A7whZBUQ2HVUOWg1+9jH/S9du9/KqqyG6/gYU/h20MAjuEiGQDdQHrS+0oBaUWnaN0QIFzFbRKicx5Y0i3INqZ4ZlBkE8HWYx/aIf2queBHw1xo6SraSxf0fYFO75up3+9Rp16nuKpamownsq6v7m1ICf/Rt4BB9vCNbm2f9iohZsQXUdS7/FzdRbBZ/N3UMSj0MW11lRd8h1wGb/qwFZ4yv1CnCXiAfaTpBCHq8m/YLBTALatXXg3/zwwlFNv0xvdTWRRPswIZS3mWphUrb2781Mct5HpgN7d4PqqZq8BWRkYKNKTo3NS2qw6GmLWAZjxlxWImESYAVbSSiHNPwlQj/4VrJijhGFYF/pCEzIJWzwr87yTYvXcXoL94xWGfUPVeCkKZW7FcM34ETlP3uF2JCNpolhzDK5SsZ+670EUdLjpJ+qawA5n1N8MRG92iGhNKko1S93B4K7TBLxEulRuQ90kZ7YKmn2wFXEdcwoGtDhaciw1WLP8jR8SQdDdC456HY25p3EcsAChPRCcsm0lVuqeyyuAdcqZk36vJQUh1OVNBfD90TGGGbysKzzzYTX71DzZDySzUDDurjEcr/fNWOUUn+5yPkjfTCnsPBR3CH/Q5JLhHbmMi29+U5OHeq9Z1n8+FLpL6Q1EQL9yw/wSwrhIMZiswiqJI2OSr42JDLxmWwwOHrQCYAam4XRDo4/EwjzkFDgI0ZfGWjzZErsYU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(7055299009)(10067099003)(56012099006)(261022105027099003)(261026130827099003)(261022113327099003)(261028144727099003)(261026121527099003)(261021130227099003)(261021121427099003)(261022075727099003)(261021123027099003)(261021135927099003)(261026140227099003)(261102123227099003)(261022115727099003)(261009223027099003)(6133799003)(18002099003)(83080400003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?teP/UiSLCgU3nVhgGeIHqZNeXHpjCJajU6JWquU6EtARnG2uV0Fy5AFTKK?=
 =?iso-8859-1?Q?WSwZwNd4a2vRiMuU4FxLlbVJ+XxMONBc2c9haE3xs56JDHV69lNReIQBYM?=
 =?iso-8859-1?Q?CtthtrFSrQUrTgMQq0dGYblfJfNK42kh5DNNnD0X4BOM/tyG8kT2FiNgwT?=
 =?iso-8859-1?Q?aAg+V89yCy+b6/DtUAldob+2iB17emi80gemGXVTwO6apugizPaf06uBoQ?=
 =?iso-8859-1?Q?8I2ms3ACXHm9u9jRwT6CaLYMe6mRNtqO5z5Lml0yNg0ieHH9FswLmMZe2Y?=
 =?iso-8859-1?Q?8l6tOUTa8Icrk/8eCoY85snIu/70TNjW1HfodToh9skv/rXCMCpNv0HaiV?=
 =?iso-8859-1?Q?z79bhWP19dYiLdNKxJpu7eEBZT3LQT8cHTV9gXggx8C6+lvXPz4mplOYAX?=
 =?iso-8859-1?Q?YfIwuYGYISOBx1Larc+JNKQ7a9KmXvEnx3F0Vyd6wPDqzC6QzztenvPiG9?=
 =?iso-8859-1?Q?oKZSq28pZHbfj2jXaYA8naPSfMm+gvzcqWEkbJK1hHCEPxqVmSJoxkb5KA?=
 =?iso-8859-1?Q?XgkB3aMWBiXC/AqvIdLo9zOw8OusNZBvKA1nzE7Fun0N7d2HBJ+AxLVKz2?=
 =?iso-8859-1?Q?UJQdyTR/MPlsGdpWWHH5j6/PRFMqeGEAr0LuOH0yieyPM5LUXLHJnxELU3?=
 =?iso-8859-1?Q?JmqXhlJ2NnYMSO9dhsdZ+R5/KzT9u1KNEjoHd3L9Dr27M28O3X6JGgGzrC?=
 =?iso-8859-1?Q?NVC8RN85nXQPGMf84QGJSv6XnOweUGPKy4bajoOMLl54cg3ky8CWKgyLf7?=
 =?iso-8859-1?Q?MNMvgufQMz/MCYVR7e2torvTAVBcKLRTze1KQ21n1alcjA+fIPjZtdosvH?=
 =?iso-8859-1?Q?TzHwOa/lxQeUXHaegJYXIEbcZ00zndtheJeJsCFGQJp2nCO6wtu2EeAcN+?=
 =?iso-8859-1?Q?yek76b0JFauMjecOV2p+EOjyjhuA3B0NxhHQuIdWODgSst/V+Z/FxQCv47?=
 =?iso-8859-1?Q?/pLyTwMyutXKPQPW61TM86XoXZNc+3KnWaX528e7sKbGQKYEo8w2KmiLTe?=
 =?iso-8859-1?Q?9wq0nMJeASbIsk7PC+JKRxKyjHVwWdW6fdvt4CQ2Z/zbXmxxQuSxDxLuGG?=
 =?iso-8859-1?Q?gZkJAsNbKA5Se3ghTLiI080m85DMezWsiNCRks182K1g/5FxA6jO+Hyoog?=
 =?iso-8859-1?Q?An8OGEJcKupZ1+vQg+ZdW3eclOKmML+DQNb4N6sOUiFEmJi249ySmHSbOw?=
 =?iso-8859-1?Q?boczC1lCse0YrN2jxE5lwiPH3hVs+OCJxdJkw9mCZoR0aOph0k6nej5HPx?=
 =?iso-8859-1?Q?fuzZGMwW0nXCGo+I5QAQTxs6LJv1KdFP72pLTY4rzq0hmDsmCcpV3Wa79N?=
 =?iso-8859-1?Q?mjxb0TZCAYzdQyyEMtGVOkWOCGk/ZoYofBsyJpVx8d0yL6GmWjNYxyUv5c?=
 =?iso-8859-1?Q?kSDHYTDT613Na8/r2Y5/8rCy0aomWM6Onr1g36/j1mywiCJirYH+AY7B64?=
 =?iso-8859-1?Q?SVhxcP9kHHArwtu1pOG0YhA6sLZMiiYW4Izju0yhMD8L+CqE1X2Mi3V+Ot?=
 =?iso-8859-1?Q?wxxTy4WHDHKmcSQVa0UDuNIaBYh0MNpxIdQMYs+OJ+b/F6x07pPM54BvQo?=
 =?iso-8859-1?Q?1iglgA01NGA4DCMnKrBRlZtfz8kVzKq8dqkr2ENkYm33Co11SUb4G/nZ7k?=
 =?iso-8859-1?Q?gM9pkjAqMPnChyuH5+5qca8uGgCll27qKsrqYM0wxuHJn2urrSK5Su8z8v?=
 =?iso-8859-1?Q?c/uiYV1+5txw6kOyjy2OXMpAs6jSloa0N+30b6KFJuKI0GzOMUycKVIFZM?=
 =?iso-8859-1?Q?iWStLyqy/JEXGxccLw/D43TjP16jkqqrQLa+M2zp6fBR4e?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-OriginatorOrg: accuratesound.ca
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f19167-bf3b-4065-1003-08df41cbdecb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2026 21:19:58.1470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f5b64d99-3ae6-4f97-ba65-24522cb51004
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TudrqNdTXv1XYl2z2eQMOzYia3BFM1poOhwjRuEOKPrDYbg6o9j8sO8bBEBP5bZ2aWPkiBa/IyM8K4IBaWRIiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB10573

Hello DMAengine maintainers,=0A=
=0A=
I am investigating shutdown/interrupt reliability on a disposable Raspberry=
 Pi 5 with a cyclic ALSA DMA RX path.=0A=
=0A=
I have been reviewing Wang YuWei's November 10 cyclic UAF proposal and Jame=
s Hilliard's November 13 v5 stop/pause series, particularly patch 3/5. Coul=
d I ask for guidance on a few possible lifetime and fail-closed gaps while =
I prepare independent kernel/KASAN tests?=0A=
=0A=
Source baseline:=0A=
=0A=
Raspberry Pi Linux 6.18.50, dw-axi-dmac-platform.c=0A=
=0A=
SHA-256:=0A=
52d7f988122b4bde80b5da61ad6d2518cec8af6650a5fe08a4628c6ca8e48084=0A=
=0A=
Byte-matched to:=0A=
raspberrypi/linux@cff533aec2fa601846766b32ff57204e0a61bed7=0A=
=0A=
Neither proposed patch has been built or tested by me. A previous RX "IRQ w=
ith no descriptors" warning occurred near capture STOP, but the raw interru=
pt bits and event ordering were not captured. I do not attribute that warni=
ng to the races below. Earlier TX stop warnings concerned a separate channe=
l.=0A=
=0A=
I ran a source-executed userspace ASan harness against the exact virt-dma.c=
 and virt-dma.h, with mocked Linux APIs, interrupts, hardware, and platform=
 STOP logic.=0A=
=0A=
GCC and Clang reproduced four forced-interleaving heap-use-after-free trace=
s involving:=0A=
=0A=
1) Pending cyclic callback alias after STOP/free.=0A=
=0A=
2) Alias surviving an error-completed-list transition.=0A=
=0A=
3) That error-completed alias under an abstract issued-head-only Wang strat=
egy.=0A=
=0A=
4) An executing callback_result client accessing freed descriptor result st=
orage.=0A=
=0A=
An ALSA-style legacy callback control did not dereference that result point=
er.=0A=
=0A=
These are software counterexamples, not KASAN, the actual DesignWare platfo=
rm driver running, or an RP1 hardware diagnosis.=0A=
=0A=
=0A=
MY QUESTIONS=0A=
=0A=
1. Cyclic descriptor lifetime=0A=
=0A=
If a period interrupt sets vc->cyclic=3DD, then an error path moves D from =
desc_issued to desc_completed before termination, can an issued-head-only v=
chan_next_desc() check miss the alias when all lists are freed?=0A=
=0A=
What termination pattern accounts for pending cyclic, completed-list, and a=
lready-executing result callbacks without blocking in atomic context?=0A=
=0A=
=0A=
2. Failed-stop teardown=0A=
=0A=
Hilliard v5 3/5 returns the stop timeout and retains transfer descriptors, =
which is valuable.=0A=
=0A=
However, generic ALSA STOP may discard that error, dmaengine_synchronize() =
returns void, and later device_free_chan_resources() can still release the =
descriptor pool.=0A=
=0A=
What fail-closed recovery or quarantine contract is expected if hardware ne=
ver becomes idle?=0A=
=0A=
=0A=
3. IRQ latency and hardware quiescence=0A=
=0A=
V5 3/5 holds spin_lock_irqsave() across a potentially 50 ms stop poll.=0A=
=0A=
Is there a preferred short-lock IRQ publication/rearm cutoff that avoids th=
is interval?=0A=
=0A=
Does RP1's cleared CH_EN state itself establish LLI fetch quiescence, or is=
 an additional barrier required?=0A=
=0A=
=0A=
I would be happy to share the minimal userspace reproducer and follow up wi=
th independently obtained kernel KASAN traces from the disposable Pi 5 if u=
seful.=0A=
=0A=
No driver change, backport, product fix, or firmware implication is being c=
laimed. Any correction to the source ordering or advice on which existing t=
hread to follow would be appreciated.=0A=
=0A=
=0A=
PUBLIC REFERENCES=0A=
=0A=
Exact Raspberry Pi source:=0A=
https://github.com/raspberrypi/linux/blob/cff533aec2fa601846766b32ff57204e0=
a61bed7/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c=0A=
=0A=
Wang's November 10 proposal:=0A=
https://lkml.iu.edu/2611.1/07555.html=0A=
=0A=
Hilliard's November 13 v5 series:=0A=
https://kernelthread.org/t/20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-85=
23a27b5788%40gmail.com=0A=
=0A=
=0A=
Thank you,=0A=
=0A=
Mitch=0A=
