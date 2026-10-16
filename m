Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023112.outbound.protection.outlook.com [52.101.127.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672303B9D8C;
	Fri, 16 Oct 2026 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147778; cv=fail; b=jxJ7woYtRhbHX+M4ySdXCfR+dOzGgI4+iP4q9PPzpwzxPSR3NC3f8HSfSsVrJLp8MaNveSqawojusUpE9vrgqFC/os87GQwpmOfGGdMOM/EpQFcpgnKQ6Jhg4+78mOImLWgvehnm5Ai62hv89M44cVHeiuFVPsTB4ONmX+lflfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147778; c=relaxed/simple;
	bh=jy6F+cP+fjD7ngk/PkUyXNpC9fm1q7HwP1BAlpRJkXY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mvzCIGXQhQsCjgkaxziPV+oOqoLp7klI/mBGptytRx5+3RPYumbaeHm1yhxbI65IROziOlPNPjXDh3BNJ4ThCb8TcPyBuwx6GuOmnnhsewryZLzaNBxroYRUcuTeGkK9jS2Pp5k+iSR/Yb0enAgvMKXtxSzOYBIIxAgM6qlukfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com; spf=pass smtp.mailfrom=crepuse.com; dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b=nPyVw4Mk; arc=fail smtp.client-ip=52.101.127.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crepuse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b="nPyVw4Mk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvFi9nG/+17fen++MrxkYeaw1gB3h42TIVa/qalCkDqKxvzvTxkJ0aOzEQvUHphPW/gY9FnQ0X+beDOim2tCa6E7JituH5gac6H+rnJhraKgWT2hkdqmW6Oc4nIVpkZgaDc7nlAHFvhv0QkwEKqzz+LKXpOybEUFqUeP6/ivbGB8pL/rKkCGOWUZ3/32qes/jVoCM3a8h1Jt7CVQugEUN2zExfTO90Ec9cPxsrgwUA0sARMy5zAVF0PASjhqSFNsWNpXiU4dh6C+71tI9wQKq33GrKJpiZ9/MeF2bWdPbAGgn/Ng3uetlvrYR2X4Co7oJNd5O0duu/buGtXXoVuYfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jy6F+cP+fjD7ngk/PkUyXNpC9fm1q7HwP1BAlpRJkXY=;
 b=yqQy1ISdtMTbm34q8mJ/dGcIT+Xf+o2vXT7Y4SnDPRTs/V7M4TMsQGsH3209Bpofz0F5iSMHnMF0jM8+nKaX66gDQ8rlaoAb4yc2jV+QRjaMSv86wK8zhCWbVCBb/gnmi9LrouaHYsGbzLdXWcKAZfvXZLsXSmM62LS0KyxGQqnXgho9fVJI/NBRuiZKjZpb59EPK75ul+34palVSQmvavGDTRM6a4deG2swiu06xHcyHC8fviWBYReGXVZsPj1noYiJADgyccjNitI1zmgZO3u2yUvUbPrzdaN2xn9ERs9UP20WeVM3V5+WLUTHFcZV9gPgZLtCxzxc8oCi8HyWOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jy6F+cP+fjD7ngk/PkUyXNpC9fm1q7HwP1BAlpRJkXY=;
 b=nPyVw4MkIbJtpG0LRC+vcjtbG5gX7by5Y+R+Me/SPdhwQZ4GfarX8wF0TwPmcAC1RBla9X7VH4A/jQB48EkmxPUXF3ncvJZgBwgGOrgLoKaAjm3y6GZpo8XjMPkLS0/UkTqe0yVczo1LgEe/V3H8SGj186mnsd0X5CHy9rKH13lvHGX+3KZDohLs01RdwxzLQsg2eokf0UvAnWEtQlP0X2iESVIZvORweYEf/qSUYdXxl2+cvHuck17TGLNS3gdZCnrMrao3xar0MSFMp/uZKKASKARnNeFZ+Uv8xEd3W7cxfw+kJOsolPo/3sk9VHUsr+iL5wArlPwvI3wQAjCuxg==
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:8d::16) by TY1PPF62707212C.apcprd01.prod.exchangelabs.com
 (2603:1096:408::32e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 10:49:32 +0000
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a]) by KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 10:49:31 +0000
From: Mizuno Miotsuki <founder@crepuse.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: "vkoul@kernel.org" <vkoul@kernel.org>, "dmaengine@vger.kernel.org"
	<dmaengine@vger.kernel.org>, "krzk@kernel.org" <krzk@kernel.org>,
	"ulfh@kernel.org" <ulfh@kernel.org>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"huibin.hong@rock-chips.com" <huibin.hong@rock-chips.com>,
	"rmk+kernel@arm.linux.org.uk" <rmk+kernel@arm.linux.org.uk>,
	"sugar.zhang@rock-chips.com" <sugar.zhang@rock-chips.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] dmaengine: pl330: Fix unbalanced runtime PM
Thread-Topic: [PATCH v3] dmaengine: pl330: Fix unbalanced runtime PM
Thread-Index: AQHdXMV208bX6Br160Gw/tHwbdDZA7b//nWA
Date: Fri, 16 Oct 2026 10:49:31 +0000
Message-ID: <C35ADE64-5E80-454C-A66A-BA2B22EFF386@crepuse.com>
References: <1650450456-34351-1-git-send-email-sugar.zhang@rock-chips.com>
 <20261015-review-pl330-pm-original-v3-v3-1-5be09f37df77@crepuse.com>
 <atEEi7Uc7DI2pkg5@lizhi-Precision-Tower-5810>
In-Reply-To: <atEEi7Uc7DI2pkg5@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR01MB8186:EE_|TY1PPF62707212C:EE_
x-ms-office365-filtering-correlation-id: c68dbb7b-d0fe-47fd-11a0-08df2b7328d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|38070700021|56012099006|4143699003|5023799004|18002099003|10067099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 HLj6Hl3yyZKSaVbDaxUNfTKraKSW6bPiue5rPCg99v+A3/zTm2mXFRkpujqy0syzjDq1sIVTH1pdOiQz1BZiqggJsY2YiXqC67JlBCYUBsqblMakgdhp3FZWICaJcpQDkbshlTs34EKFywCkO7JMZCFud22DWEduW3UbOlJ5xzRcOdldN7sfashXYcYpsB4vC5PHrRWdiu04xyjdfG57CZmneUa+8ImYLTak4igaICcvi5uUabZCkU8CG6P2X6DDRN0oeOScdRmR1QrNrBmUNjaY+tBr0qoB1yUlU9xiQ4F4RODdLtWTAkihgvDcjTil+Q2zO7tLPsOuOoYZevB0dhnt0ankhWpA5eTqeut8ahM2ln3/SKO5vz32ecJ5hpE1KDf9is5megSqikSKof95PMZeLn4+op/8hK0DtvxA7ZlMO4zdwB+iIXG7DghkbAOk/xHet6Gdsmu0aJlLI+iYfSnKJpFmWaRiVDThR2NJ8pds+3R1nNUzPuJ1Yy+tRJRN9i/QACfVbCmiC8aqhOxXGLnJ+L2w9eMFtr+NCQE3vsO1Fj7/H9gOiAJVqOZ1vK0+QtSscclFlski80a6YYqfvogLKVIgBLWCHTeOM0ILQZ17/JVWebRZhDpi6vUL1C8CTu0VoNdsG0flXxfLPvaefbrAWNJzNMeukbLXVIIylJO5Gc59GppjmZFarg1htq6PBMn4+IR6zlryckf/pZfy+nW1WGAkMowgnKCbQXd88NI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR01MB8186.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(4143699003)(5023799004)(18002099003)(10067099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fflw7zD9ttCeEs3B2pUm6EWPnvi2sm6UIrK2OBPCL1JtSnqZUNvXR5f0MR95?=
 =?us-ascii?Q?CcG4u5YZ79fOLgPbEtOGP0wTfNIbrlpkMupL+P6tdi58f2Il+BrhI1L7nRp7?=
 =?us-ascii?Q?bPywqtoKZBqZWZr/YaeaSw2t1g1yQg4qOG0/MovTeV78r+qwsbxyZt/Q7gJz?=
 =?us-ascii?Q?TH1ccesqi91JAI8AMqg/0B+nZvTVJeFr+WMM7Jg35SLgtTWCI619njVHBMjG?=
 =?us-ascii?Q?E8u6hW6OYvi2V6b7un9vq4AEYnIb/s/I8iz4xSofRw90sLO4blZAxfYRKZdR?=
 =?us-ascii?Q?MDVXUyApMl3oQk2bwkEENlb0VazOqWgx3Ki5wN+IanA5FaUb6TjDHNibnp62?=
 =?us-ascii?Q?C5oxC9/9sBAzqMoWjHcZgcIBtDCySjeyV4VAP7FYWdsYYrTWljJalqPon55U?=
 =?us-ascii?Q?td9P4fCzN7bsk34J4HVXmg6O/j4P37MYGoGmVginXoFfI85S70ryT8ADx9+5?=
 =?us-ascii?Q?Jx28Z3J1GLSNnYL893xbv3CklJxTEGdvWC9wYiR6x58q/fZ5r8AHI15eFBwS?=
 =?us-ascii?Q?QU18LZB9ZWLO5775k5WNarIOqvmzlKzh/7NPoBD59eTNGQPfjb6L/TNUR69s?=
 =?us-ascii?Q?apdKXbRTsqzI/rCD0tDzCCnKqAke6MlUAj2lf+H2aNwVg7GeTjt3eRuVbhWb?=
 =?us-ascii?Q?mu7HYpdZPG6wjJl8s4YDiWd8iL4W7HxMAuI1F+IVy/es8MG6PBJsj4BCZoBz?=
 =?us-ascii?Q?hDt9Tu1W2s08AmE6Xj6JKfmfn6ZiS5iSP3mfFsiYhz4yUfBYLmXGBEdsEZAu?=
 =?us-ascii?Q?ryQInSfcxM+da6qpFNTPPu5Y9KJeMqFj0edwYck6uAUxfc65Mdw20sdk9vqH?=
 =?us-ascii?Q?eh5lRiTxbxJPt5v0QzOE2gFoEbZJDYN67+LkVZ9wu56JAsnsRekRGA/CD12R?=
 =?us-ascii?Q?R+YTNFmlV3AUazrIThMEZmDHn9VZnVsOhybaV0O0XcN6dxBdaz6ki5DHx6WK?=
 =?us-ascii?Q?HRUfHXyfjLwTaa838xYdEgjIOk0PWWZmTcbqsgJPXmpUcsNwAnxRdT1yF1iq?=
 =?us-ascii?Q?XsS5pTZaebycqKYgXf9t1UHBMbQ+V0i7LO4rKZm1IHvGJKUCU3wjfvVc0sNE?=
 =?us-ascii?Q?E+sHzGZttJ1jMyuot7WsqPZFiz6IVvTyuryubDvX/BV4dMH6MYePhRkYOaMQ?=
 =?us-ascii?Q?/v8dG19YgyG/JjE7rtJ1qaaQqJBU4xzuOIDTtPkJxaUpaQcVxMWSvaoKnbfm?=
 =?us-ascii?Q?9uR5toQRtE3X6wjn9jYjxJunSAY5XG+ZZou6ITNLNAMk0Y7oIu5WDKXpCaLX?=
 =?us-ascii?Q?qawCFbQDgpZ3cxTPe4obdrhnc4VRqewFjgpIBBhh+4x5NeSQTp901aUAaWQo?=
 =?us-ascii?Q?Y6+52+NE1ILw4E4RWO5JkfnlD5cD1CSd97G5bto0vriJAblqs1+xShSMRFIW?=
 =?us-ascii?Q?GvWyqjyALgEq1cVgR4uUbEPObkFFhMTlPm/2HHOP8k/JOioz4QyRMHu+aYFL?=
 =?us-ascii?Q?6UJ1wwJ9+sXOHqHNeDAyBG8oQStxygXNbgdlgcbSFJLVyVxpxt6Fy/Defvug?=
 =?us-ascii?Q?Axxo3h5i+2NAvmxnv8CAPlicpWgKmcl0B7OActROme5XW/AQ9Y2NZByX5jWN?=
 =?us-ascii?Q?ymiKe53py3g5jKspcuh2LormvUNdLO2gxzbcjf8h5Ij4TjXRkQUbbYxtEHKo?=
 =?us-ascii?Q?bAlVBFPBpJJCPtmRnj5NBBD4FtUh957GaTMhopsHZQwi0k7/1UxRISV2x1Et?=
 =?us-ascii?Q?mVBiwVa0K+TwGwS54AfQ5KPxGTHCCGrCteG+ygfMx/z2bCe1G6QPusnyDjzi?=
 =?us-ascii?Q?o1+je/3E6g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2615C4440DC55A41A5944E21F2D0E59E@apcprd01.prod.exchangelabs.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c68dbb7b-d0fe-47fd-11a0-08df2b7328d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 10:49:31.5905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9e189589-0b8b-4283-80ca-b0157c0a04fa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UnTIpaUU8lfIpj6PqoiXvacWB6giR/cK6hai7GBI8ypb5tVkv/gOM4hDQhTPVtL70J2mfgtdIOHnWlVhd1Jlwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF62707212C

Hi Frank,

Thanks for the review.

> Look like need lock between terminate and issue_pendings. There are shoul=
d
> other problems if interfere each others.
>=20
> terminate should wait issue_pending finish and block queue new request.

Both pl330_issue_pending() and pl330_terminate_all() already use
pch->lock to protect the channel state. However, issue_pending()
also invokes pl330_tasklet() after releasing the lock, so this
does not establish complete synchronization.

I ran a source-based interleaving test. The original
code reproduces the extra runtime PM put after termination, while
the proposed one-line fix balances the references under the same
interleaving.

> This function can be called in an interrupt context
>=20
> call pm_runtime_get() is risk, which may sleep.

pl330_probe() calls pm_runtime_irq_safe(&adev->dev), and the AMBA
runtime PM callbacks use clk_enable()/clk_disable() for IRQ-safe
devices. This allows pm_runtime_get_sync() to be called from
atomic context, provided the relevant PM callbacks and dependencies
satisfy the IRQ-safe requirements.

I agree that the remaining synchronization and error-handling
paths deserve further investigation.

Would it be reasonable to keep this patch focused on the
reproduced reference-count imbalance and address any confirmed
synchronization issues separately?

Thanks,
Mizuno
