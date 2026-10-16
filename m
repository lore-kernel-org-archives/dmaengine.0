Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022112.outbound.protection.outlook.com [40.107.75.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B261C29D288;
	Fri, 16 Oct 2026 23:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792193970; cv=fail; b=IHkk37uUeGnjRgoMR+OCjqLEMOpjGms4RiVWPkbr7JMR+x39+ydRGs4yrCoZ7mNCx2Sp+A+WvOD4bcrpzzs5TtaeVhMTIizT0amA157M1WFEA+J05Vl1AUgxdj2xI/onkwGFrqA0jW6DEXtMtk6f3plENZfwwFLQn6HA/nnDgng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792193970; c=relaxed/simple;
	bh=fa9fwsDC+EkLOJiugUNgdeYJ56tIStDkGRu7EO663Y8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V3WgVVeOa8EWb60z1eOks9Za1L+4Z6lEUQIe85wxwLrILEIkAtJ7sXpfRLSXQDrPIH7wQyLl/Pm48fjr1ju2d30zy/YY7ykPvOOQkDqNmIew1lacFau9gcxF3wDlU9rcfqmE/Dxi6KAJHtx2Yan812TUhpuOBWBaXoc3+6WCCrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com; spf=pass smtp.mailfrom=crepuse.com; dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b=VcUreI68; arc=fail smtp.client-ip=40.107.75.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crepuse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b="VcUreI68"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sz2Ae/NbaedviLbNx+mGsft9qw4kjN6/v1C0S0yPkJVqN1s9+J6jLb57jAhzjg1wjYW1K8YHAK1cSFIgqXLK33WfcD/I+fX2xnbN5+rlP6XUovENXzZfMIB3X6n+PA7geMNAhY4p+n/ctpjgteMO/XhVR2xsBgNAzEzFNoJrLEEDkxdcpnniM0PP3kqisW4s0RKjqUVGCnISo+TxWHlERdax0ii2rBDscKTbeAe/1pdQHRPjEmuKMA+C+65rqHsNbJgtGT/yYAslyP6758DEbJWupg7x92XIPHZgE0BlzpEbeD7viXoiS0kQoETDyUl/WHN+4aYEPSIgbS/6WlZMug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fa9fwsDC+EkLOJiugUNgdeYJ56tIStDkGRu7EO663Y8=;
 b=BDgTZpXXQVeotRCenuqs+0uPbIQYwf9ZaatLOJcn5ZPyb8RB81gxmz4gDbyVhGfJdxM33xel919jJrweHk5rE43qUjIm+ZGLjh2wTTs4Bs1lRkyHy0VABqaM2UGU1aCIeFQM43Tu6lo26uizRex/jx3OIUf+Mq2Ao7DpJildmwm2XcmNXoo73ENyfCjg/BaFDawUYPZ+YKMpdYQ7tYdjHVVwdvR8BalS27xF8TxDGwrn4GaTa37VWRxS0hdEEPoyPqw8gCRPixij4r+4LmIckZzV5V0YxI7wewAu58j6/UsQ6tR+8l1g2BFGhgpx/fV72j44+sxW6vOx/72vh4OOmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fa9fwsDC+EkLOJiugUNgdeYJ56tIStDkGRu7EO663Y8=;
 b=VcUreI68SYMcF5uqJmk65Uf1Fi16+OrEOSAHq43A3Q6kKWCmdEIpVVS/z/U81hA0DD/BVYxytpbGPzI1PFk6M1dxM0jssRQr3o3bHqsT48wFUAUIDXHThkLw+U9h8CYGK4oiHZBL/9v25n7OARjPqA9tg3vPE/lJqsgQfL5cOKF+dxXxxqKUA+sRioWcJOSpEU6Tm9VnIMrZMKUZpfcSRF+TolvSFhmvHy898yo/GOclnfOQW8Afm6W1xlcB7qw3uZJ/juRgVYgaZK3zqLCkZDl++hETl1m6BPU/vZQtLCzC24FZy2PJz1exh+mwqHSl+XEzfPHXcqHb3Gn0dIUW4g==
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:8d::16) by PUZPR01MB5093.apcprd01.prod.exchangelabs.com
 (2603:1096:301:113::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 16 Oct
 2026 23:39:24 +0000
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a]) by KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a%4]) with mapi id 15.21.0522.016; Fri, 16 Oct 2026
 23:39:22 +0000
From: Mizuno Miotsuki <founder@crepuse.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: "vkoul@kernel.org" <vkoul@kernel.org>, "dmaengine@vger.kernel.org"
	<dmaengine@vger.kernel.org>, "krzk@kernel.org" <krzk@kernel.org>,
	"ulfh@kernel.org" <ulfh@kernel.org>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"huibin.hong@rock-chips.com" <huibin.hong@rock-chips.com>,
	"sugar.zhang@rock-chips.com" <sugar.zhang@rock-chips.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] dmaengine: pl330: Fix unbalanced runtime PM
Thread-Topic: [PATCH v3] dmaengine: pl330: Fix unbalanced runtime PM
Thread-Index: AQHdXXo408bX6Br160Gw/tHwbdDZA7cA1CKA
Date: Fri, 16 Oct 2026 23:39:22 +0000
Message-ID: <6D6012D6-03F2-43A5-9F87-91BE480A7435@crepuse.com>
References: <1650450456-34351-1-git-send-email-sugar.zhang@rock-chips.com>
 <20261015-review-pl330-pm-original-v3-v3-1-5be09f37df77@crepuse.com>
 <atIz5ZsJNUZ1ocE7@SMW015318>
In-Reply-To: <atIz5ZsJNUZ1ocE7@SMW015318>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR01MB8186:EE_|PUZPR01MB5093:EE_
x-ms-office365-filtering-correlation-id: b5d20d39-a0a9-48ba-91cd-08df2bdeb500
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|10067099003|22082099003|18002099003|4143699003|261009221227099003|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info:
 z+x6pno0CV9492y+sAEZBfJ8nuYmnRIuVgCfbBsiLIZerYy12Nr0hhoGL2xB7ffPTN7LMVckW+ZAMOCoR0VeFFM3dWC+/x1E2nBq0Uxyuv1DBqi2Pc03eLDMFzO86mClCB+Hg/6lxjZw6jL2UFZ4iXHqg+pOOkXVEOozYWqI1haBQQjuHm4GEtLEbweMD1SdzUv6sirZHz0SB1Cm5hLnISSESMNuqG0mjz8i9R3Y5bUxlOv2jtQ9cVDv8Gi4pqcU1IxfBo8nHfRBPToE5YqpqBQHExU/PWFMIrsdpvx8OnE812f0RuC8ahJndOWFaoct1nW0Odh05yKrCNwRD6L5DzBaqpIwUYKHTi1HQWZTvSbUeYK9sV4uakKRTJG93+ewWdJtvWT+4tFnrsvVcMcRV6lHrlkCAd769fHrDAgE7Fr280bXvpkWsx2Ibje6T2CWMCc7I9nr1osnZl0N1AQPbY4Ndo6C31su6fJn19QOEhJRs88U5uE/spfsfWv3WJ9snL7qs3CJ5N2UH43wKHKaaWK4xZlb1Ed3RnGlB0AL49Y1mZUbTNhRmqFTw6/5fyOhgUKwLTGS0CpL6UcmTVHQrtIVzVoH395xYJlhWbqbGMz1498O/NiZ13febwLzl83manOGSjOQRMPkHV08Oi8DWb+Hy6dEZxRQL2swtySH20T64ZoAGth0aDNdlELdp4Ci+7GsQco6chPA3uTkHvz2tA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR01MB8186.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(22082099003)(18002099003)(4143699003)(261009221227099003)(261009223027099003)(38070700021)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MPOE9D0WroHBTycgI2+Mr5y1ccY0SMjXDGlkZN+Smv61mYkJf7bNmL+OWJUr?=
 =?us-ascii?Q?daxkXH46wfcjZyxAbD16hBktPzrTpd6Ifbs5QiTd3XRRSITUW+2jGg4H0oG7?=
 =?us-ascii?Q?5lf6KpHmzddSTDdvyIlMNXRHBnqBz2wtH2Ko3NbBKD7xlTBy42W0HPTY0p9X?=
 =?us-ascii?Q?4hG965So4Jw1SRTIwXiHboUOZ4/G9M4OFuHpYTucvN9uojQPPXor4U22tVwv?=
 =?us-ascii?Q?UiwyNrkUqfsyYTdh0UHM6MXs4LWp78PNNb8gBb6S5z+C1ogCaoO1DXkTHRGq?=
 =?us-ascii?Q?L8R/xzVTVeXdwQGuAx3AnvMxTeP7DaNc67BgAa+Tp9ZGm6gQ9wzdk4beT6iX?=
 =?us-ascii?Q?dQUDZlkp2ZDe2jjzhcG6seopzvbBnRK/LFe6NPMpBOfWtX8q58AxN1T03D1n?=
 =?us-ascii?Q?xL/3Iw+gjYFhOHDcoRsdOKRrT3/2o8SkU3XceBrUgHyMuOUZzF82ljeRgfQn?=
 =?us-ascii?Q?S3dR34UfwexbfywMK7pRGPi21lckqNtJlq3ScDYF6d8TaND5w8YUvE/OSjPk?=
 =?us-ascii?Q?SvL15wcUkRdWaP0WoiPIXCrSOyTnl4GiCneNU+8KiZFi8DzgdzxP74dBnQyb?=
 =?us-ascii?Q?nSWsLlF5gvx/JwjghyRbieG0V+vX0pmYuynYn+mxtbiEMEN0RdOdXlTEWPih?=
 =?us-ascii?Q?ljxfejMJ0rvZUrFLd8seAOxT8ojqlHp25cFk9++LN0SGCvoth9wa0UTb9iAq?=
 =?us-ascii?Q?mjZQ3tzKsKqLt3WUgcyWSSGVcRQEJ4DyZj2dCWYocYtZKeEx1v7W8iBvmwD8?=
 =?us-ascii?Q?cFITqw0t43JvU1DerbeZktqjteciURmgjSiip/FC8p+Xl7hu8u0DQqG964YP?=
 =?us-ascii?Q?9s2S5ANo1Ba9d6DgMf8dbOIuEDVk/SU1qAFcsp4Gm5VHOPOW/2m3htWlvrbg?=
 =?us-ascii?Q?XoetSekvx3jl2DQtOHVUY61p4iguDzlj8Zk80DVgDLzE3KD2sj2Ts1Kp8FU6?=
 =?us-ascii?Q?idDcpPxzyIb2aSeX8otuXiQEOBdHpcoxhrBhx1tGKAArMeo9qh1sBZZUqXfo?=
 =?us-ascii?Q?PluFAcqZHXN67PG67gM7Zf4ROL1lFKF3SUy2ctcqxC+WeXYO792vW+SyrMTz?=
 =?us-ascii?Q?SBdJok8DdO1+2mplQ3Ti+FcesY3bC6sfNOajLqc0X3a9PWyXYwqxAOE/X7ua?=
 =?us-ascii?Q?U5S7SPwBMHddutGKtd1T949pTUj8Sj0eYq+pAOTPG4qpyM8LlXHobn3fqsRv?=
 =?us-ascii?Q?AhQmrLnpWYcCZnzFES9gkJRmlIwil3uhTLi1CPkaS7snSXa80dfDxD6BqHy/?=
 =?us-ascii?Q?jrg/L4uoN7OPyuuvM8WNTtPD4hmWB0f2GBpYQPcx3td5wr6QLMhW/Vm5wUpz?=
 =?us-ascii?Q?ftN/A/1YUlmP0lTJb7MTN/H7qWO+2uJn39jXrkXJeMOb9uY5dLZ+DsyYNRs1?=
 =?us-ascii?Q?GN6oBxOjtng2ZAHDk2710bLg/hLfP4c5BOLwtvskNzUScuJ67srOzVGJhGv/?=
 =?us-ascii?Q?ovqjyttxe203Nu64EoFtxuvTYpGniSNRm/1t9f5Edr1zoRpBeNxSEXGiRbyw?=
 =?us-ascii?Q?dyvYdp6OHwWsjOcjpiwEv4BmQzg4RzRNDqA0KixtHfTW2l/0oYPHQ/QkCk5b?=
 =?us-ascii?Q?xpVzwTsxWwjRdZDGVOkfetLdPcC37ADCdZgUclA7e2JheAKCa9rbz/Gd28WL?=
 =?us-ascii?Q?UlIe7EO2pdgjkMgDrn6KGlenNEj9RzpxQziTrUaJlSEP0TMh9P72cjpGxVgW?=
 =?us-ascii?Q?hU7lHE0YHK9PTTMuZ/1ZgNs3R2C7n0YnvI1sy7FGxway60Zax4JqlCmtjoB/?=
 =?us-ascii?Q?zxCQIHqYOA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9E345C13EC17474D96B0C07896DE968D@apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: crepuse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUYPR01MB8186.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d20d39-a0a9-48ba-91cd-08df2bdeb500
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 23:39:22.9320
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9e189589-0b8b-4283-80ca-b0157c0a04fa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AVksHGpZUPqRF6yU4JsD8DgcSjqLEzLCoCF2leM0LFczNOTt/Kse1OtXA7THKc8lEyEi2nHu3W+jxzL12Dl6oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR01MB5093

Hi Frank,

Thanks for taking another look.

I think the interleaving you described is already prevented by
pch->lock.

Both pl330_tasklet() and pl330_terminate_all() check pch->active
and clear it while holding the same lock. Whichever gets the lock
first can claim the PM put, and the other should then see
pch->active =3D=3D false.

The actual pm_runtime_put_autosuspend() calls happen after
releasing the lock, but the decision to make each call is still
protected by it.

The issue this patch addresses is that the tasklet currently sets
power_down unconditionally when work_list is empty. If
terminate_all() has already cleared pch->active and released the
PM reference, the tasklet can still issue another put.

I agree there may be other synchronization issues around
issue_pending() and tasklet callbacks, and I don't mean to claim
this patch fixes all of them.

But I don't see how both paths in your example could observe
pch->active =3D=3D true for the same activation. Am I missing another
interleaving?

Thanks,
Mizuno
