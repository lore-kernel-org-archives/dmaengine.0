Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794860111;
	b=rG1tV4xtrLuFzN28bLGD5iHKjtw4VKLx0hrs5OTEW2JmBYjMl8Kza0/12xQvJaApVOuA
	 IsD1FbKE04AD+iTztpunzsAjnbILjNjAR3/zMPUTGnNUKmS1s75G2+8X8R8bDw2sBP5B6
	 VEL9sCk76FDYIPuE59QvLzTx7Ph1QnSau/hMDDRBRHD6l0UFHAXYoNpGKHcBUvI93BfZu
	 TCIc4dhTm6ZtFX4yiuzNC8yQKXckIbS5MOCl7CQnDlFxJm8/87wI8X4c4gUWROntXrks3
	 8pIiN1cQxqpmA4fhAHczuPoJa+uEVEIfCCg/Wj+RVifl85y6SN3mSsN60zovu+LwOdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860111;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8JmBIgLJq1zvC7zXAKsbTYdn1O86h4NBq6wG14q2Ds4=;
	b=g3Hip1sUeDMY3cdV15Rm0La7ZKUVQJ5b50gYwAZ5+z6F5aWs4S525ZZP5UsheH/MxqPU
	 j6/vSNXzrPFDpD/NETrnJXgTH1vR3SE32UutedKf1zTWP8nXPVth7vWAcM4tZ9cl5tJlJ
	 KrxlPLoZr5uPdtaoMTY7TuusiSezFYCfHjYlTbMx+pWgWpGzHCCyrWPO99HaoRswBDv2M
	 V/Qe4uzbeYwrhamkcZXw1IMnplv7eYeziIsSjtuzrlIN21qyg3onEw/bgiqyqBlV0SZfK
	 Ghlh7RsNyJI6KiDppi25oI41rjZbPhjAK6xf2OOXLTu+R5Nx5ndjjjcUn/LlguhefmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=u9QrRIWr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.47
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010047.outbound.protection.outlook.com [52.101.84.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E57606A31C;
	Mon, 16 Nov 2026 20:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=u9QrRIWr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLD68y2HA2aqZXsHzzH681f7UZJw9IJjvk/aY6HUr+IakdniGCg+5Y3eRQ/LEGmeu49ZZHyFCNbpI0/HsKCHmpewAz96+lNVveqOVsATBuSrbJUoIgXE1gHffRdgrydbS+waKu6ezk6wa5k2Bz0ClSDkNdU4Mk1WjGO4pV8BatpNGHA9irtY9XsLjtWbceDeO/47SsBWh7ARCPPpEoPjB81ITu3DSzew/j3T0MvI1Mhvu1GEp2RAuxYCbLaCU7UZobMOP+wO29kDk62LRrICNbvotglqz5WgcgAwhbCy9Qco4seCCbwxliuN5GKvuzRDjwoC50VZnSp5aNFmNFnjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JmBIgLJq1zvC7zXAKsbTYdn1O86h4NBq6wG14q2Ds4=;
 b=Vi5J7TRP3Jvku/9x0Js/9YugeKR+UuEXviU/nIBI2yDZlSjo6gt+zwzML3rZId2Pn6iXWGknwiqlrltSUebwdimGTChTwR0h+qF8HBS2Ur6LGgXVb7PKZzSeiw9TyvQ/LHbvDJY7wGkUDJydi39uffrIHVkP45FxgztIydyYS4UxEn6lngbrsRktS1odRDLPRKXWvYNzIkOBUo+Nj4FfxZunFgOzM84J/y1sXXlHyPib6pAAFH5/Dxgf0KH+YABJrt+VfnUXnYfgFFZDjaoSrEXmrx6HwTM6aDhrrV/HviLO5/Kq0mHtQoHgFmy2sUE27zJPLRMOF9BtKeRGHkMVKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JmBIgLJq1zvC7zXAKsbTYdn1O86h4NBq6wG14q2Ds4=;
 b=u9QrRIWrNMpQ/eiNP0TtqftCJ0DuokQFIbA0ugpQOVdNI71IXa54kRBPD44j28YURAlK2fulWlZphP+IgdQRt1zmBvv3cWqJH/Rjmq/iynfHSp7Z0YeuP4iSI7zSaequX3it2QsiL02isI2eCJNGedBawprgu56bhPb+eCD2tkxdRk106rlLzYhVWDG6iqktGWJpW3ILNqNAeRrxz5EUWABGB3OSXRv7hBuaKwXzUA9eDWoUBOpiFjSGShHKIzFLW2wKFD9Sq4kNGUBWAgsShPBB8LTryk62tGBs81XQCa8jGaIiy8IlACW2AhYigjhFPQbpeEHgSiT5hBX0MTkJpQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB10760.eurprd04.prod.outlook.com (2603:10a6:800:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 20:15:07 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:15:07 +0000
Date: Mon, 16 Nov 2026 14:14:58 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Sergey Matsievskiy <matsievskiysv@gmail.com>
Cc: dmaengine@vger.kernel.org, lars@metafoo.de, vkoul@kernel.org,
	Frank.Li@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: axi-dmac: add reset deassert logic
Message-ID: <avtkQuwVAsN8uhW6@SMW015318>
References: <20261105134040.315317-1-s.matsievskiy@yadro.com>
 <auy6rdWmOnxahhB7@SMW015318>
 <au1W-ig2v0WKezj_@killingmachine>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au1W-ig2v0WKezj_@killingmachine>
X-ClientProxiedBy: PH7PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:510:324::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB10760:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ac3775-2cde-42f8-2aef-08df441e4ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|10067099003|11063799006|4143699003|56012099006|261026140227099003|261022105027099003|261028144727099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pEBdRtIxj8VLTvxq+G3eZRocLTOCufa6g8+qSICb7LK0w2IrmJPDARzzyggM7bfXAfdjucr8YahySVCSujwKRRFUxFX8WXAqIaddFPoP30zuunKuyeqJk+EFKop+bZTO/ZrrejP1QkJU3U3UnQrkYsCHTPkFa3OMwdTr2+3csV/OErC+oHR1nuQy6vjkb85R39lBFtnEVPVP41tFmWnhsGfxraOvQFVz0izm8RPIAEqilkhw7qJlGpzsuSy8shKqSo6OO3R8CDbHk3DzMklP0hQEUOt+g5w+riqYz30gN3l9eq9ZesQpR/UQzXY4F5sBHO8fam0CNQ46u5e058btDNTg3OYwcWZ2IX5LstW1R+4ZdPkWPGaNW7Wg5bLYimRokQ6a6s4sYCi2pHp2miAftnnTs6UpGkET82fUquM2bkbSfqNErw718TVFdlWhUhtiMI77stW/s6GIKrbsZscED5DuaatpZAs9UwsEoY/b7RbElhUN1uiKc0zLfx8gH2yvlIevlBU69T81aQMdg4/8P48INqMVnCpzxn1MPzyvwur9MA1s1K4Wq0OXwXlpq5D81Xo45Il0mF7h6WYkEQmTEmbgem2D7E+2qDl8u8S+HyWn8js/T0bOFs0sSyU5LX7jPPRzEg0K025HSRtcW/iR1prS1XmKOABTI8XjId/B0Dk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(261026140227099003)(261022105027099003)(261028144727099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mVVwdul3fL0LKgcPl6Jqy4HVI6hk8/zO/KEr0g+QkFM+lceTcXjPGZvo3fqP?=
 =?us-ascii?Q?1B6Z+LkTkAbSm6hvDKXiTZZvLvSoU/PMenUawCwv+5X0AEJPAQn4wtp3TAVt?=
 =?us-ascii?Q?T41XMxTky6ched+1hzdLj5vgTG2tmTykjqpe1MvA7uC77tcy3PdQMxkn6PsX?=
 =?us-ascii?Q?hiEtBW9XlQwGhyhoG0E6QBYFegBUw+4/AJWmKDfSOD/4DfKsBBffxYEDYIeG?=
 =?us-ascii?Q?gu53DStQqk/gObGMzLf7kPAXW36jMwHQM6gAy8+PcfVSmeG84crWJwXUF5iX?=
 =?us-ascii?Q?vo2v6FkrEwxKxL0fzzZtBEmheDqi/CFyDBtK+W8qPfuFwtwn3HtGXCoMkqYe?=
 =?us-ascii?Q?uSJ8Nl4I5fgugE1nsvjh0RxfXc1uyCDyW0g9rNh1O1HhgHrIPHnFQCKOpMrG?=
 =?us-ascii?Q?KiB+VDH+HrqBnhKNaScTYJcX70WGMbgJt5xxutsilROeXLw1yDQhElO3gYkY?=
 =?us-ascii?Q?ryYOStIr0C2AuZRpjuxC3gh2hV8AmoveUffXjgVoyQnGGZTWO27UwCANnDe9?=
 =?us-ascii?Q?Es7krP4pPtvPLOd0/OzpMcSqM8XSk9Ack8ad07amPt/rJxEJCW1ACnfxPXA1?=
 =?us-ascii?Q?pSQxpyTtEf6ckPzuj2W3J7zx1wt7WvFEQ4MAkx6krM8fUdcmuhWENIvbrkSy?=
 =?us-ascii?Q?gEo9nvSyvB1+8F9VPmFQdvwioivftECIz6YVcklhG0X39AhgFiEQZwdJrpX7?=
 =?us-ascii?Q?ER+jtmArto4Wo2EjJn7hCgnKPUnbsZUPwHSoMdRfmXtXIFOJHlgykV3Mp4u8?=
 =?us-ascii?Q?EQyX1S3Fj+Y1JHzeVHIIgoWx7pbPW236b40TtR7RU1OguwgKCjdoCOgedCsC?=
 =?us-ascii?Q?m+PzQDrdE1cHXc0+Xk8z+k5/US4ysWA1HoVOOsZjqe7BA4KbhSkHLS5RYphQ?=
 =?us-ascii?Q?5w4pJ03SH4LQ2jHSo24yQdP1bibPw7kEJKgZMLYMF8T38CMCw29d1T2qEIxF?=
 =?us-ascii?Q?yNO2cIRjrztxgUNSEUMy8uk3GYyR2fS45qOdjdjFCqAmuvjGnx1lvNeFqrp+?=
 =?us-ascii?Q?lj9p3jSQZ5ChuOvtTZR2qPnj6eK9+oEWNn6u2/y9u115CPdcTOjx7//lCJUh?=
 =?us-ascii?Q?JuE6h9DVqJA0bfOaOjv+qZEcx67zPCiDfb/NsFPclIJtoD4EHcGlBvQkWtlv?=
 =?us-ascii?Q?djuvaUbTbL3E9tngP5AkB3isDJWM6wRosylzKB8mUG6mbVW+gdHTbhUMjaFz?=
 =?us-ascii?Q?sLrvO9Wd80xu3nyu3CgIJzt6VoV8hwqlwv6gy1165nm5kbvck8mXKhfvcB0M?=
 =?us-ascii?Q?KGQ+yTwlYXcoTzq9Kq+DcU8JwCZrdc2GgodSz+jjRcefycsErOV5/4w5xenF?=
 =?us-ascii?Q?o6Jwg2z/WIHHLndr5XBamFAhWpF2WFH1aU0CbGxSO+btSpx20LeXEQYHtSo4?=
 =?us-ascii?Q?xaFPnzpEX6ghtkO3j99/x+N4yujRu7WWxlCqkTBxsnYyharyDlSt9eZY49/P?=
 =?us-ascii?Q?+/M2VMMLk1Xy9Vuz2e2aPCbHtUnPp/BB3g1LoUQrI/fj6sDRTgKK9PkPZ5fR?=
 =?us-ascii?Q?MwBFthKCvTWoWWkBIoTT6cMLE7oXM6d27Ilx2HHv16SFSysKZcBI34suvEJv?=
 =?us-ascii?Q?QOk58djf0T62me8vQuYdAWw0taBvvrpNv3RkxIMXFiC49VUAoStXpDNUQVpZ?=
 =?us-ascii?Q?UtfgZ19dAtIxuVeJuiIAupf2PZLzIn1jhZxi6yCRIYZzz3LNUwyg3s9JhmJK?=
 =?us-ascii?Q?lF5ln1p9Yxd0r2vxTC0WMaohdBIJMq9PO1mZkS0EfyYKYkdFWzq4O/f9ebsI?=
 =?us-ascii?Q?Mmr1M7nnJGgvnd9VHLFw4FAaamJ2ey/1IrVOFR1fW2Jb4ciQVaaB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ac3775-2cde-42f8-2aef-08df441e4ec5
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:15:07.2330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qDk2bTZxIioPzcjEgT6L86aOcWO8fwEARNkQYVIBL6zy1k1F0Wsjbs+JdDWJ3RNL5p/5H0LnwDNL6S3+Txoom7Lc+y33pdKX71EH4m+dbbONZbwfYPIwbS9Up57tlqP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10760

On Fri, Nov 06, 2026 at 07:26:34AM +0300, Sergey Matsievskiy wrote:
> > " sometimes required for ..." is it correct? most likely some SoC require
> > a addtional reset for this dma controller.
>
> I'd say, when this controller is used in FPGA, it could be used without the
> external reset. In SoC, it almost certainly would be behind the reset
> controller.

Do you have actual SoC, which use this reset?

Frank
