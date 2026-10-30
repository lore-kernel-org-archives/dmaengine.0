Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.143
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793375945;
	b=vpM4j3YaK+qKv4bp1DgKBZREcanwYzHCMT0EpMTWEJrN5Wk6PwSPGwZ0w1KhrN15kCFj
	 c392R1Aio5JJFX0wTwjV2i9knJysLWSoD7ECaLVurgpJIFoPEKMuuGHxl6GswcCwMjD1z
	 Vn36WsEdzLBbNKfcsBAnId3D118NghRTnhyuOFShVt9ErnnyfpYwSjWmZ9HiCpmxU5UFA
	 yE+zlF3BP7k0EpDqul/kZ5lKJlCAdb7OHr9U5Qe9iOYtd3lGH/ZNZn5eJNSTvL2U1VJWu
	 IPQ1+6AgSixjB4TS76Em4ym5oYwCKxKi9WrI/Z7OuprbSVFCAIzwYO1Hqbre2MKgYLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375945;
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
	bh=AjejYcTSqzx5cgis9uI6sbXGhbrXJmjxT476uqYFno0=;
	b=Ism5z2KR8Odu/f8Y2HacAtnCs+QHk/kppkHqyPDJIJUCklaTvJf/N+mQvb0DIQBOEFLb
	 B/4GeRCuTEXLn/t1D87G90QYI/F2dHP90S/9C8zo1OGgkar4+AAewxgnH81dE2qcJVjQM
	 cbab+7KjhvvM8vW3i56fVh5wG92J74M8p/HWQjHZOSmh2joC4HXZFjMUQcZ+WiRGQICSY
	 mY0q9S4nCHHAUQbQuCENBZMtO2g87zsIQzn4jOjnz5R5xowRM0E3iXncgVEIAkVBBuCxW
	 BsSPCHL9Cq9tfpXt3qZhCuzJ9HrpQdhykH04RwCar8RtcKDyJCKTM0rBfxp6W2+E1QQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valinux.co.jp;
	spf=pass smtp.mailfrom=valinux.co.jp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.143
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020143.outbound.protection.outlook.com [52.101.228.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3C4606A31F;
	Fri, 30 Oct 2026 15:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B3C4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HX6jkGc+hBY+rK2PoCEW3+/tj8JO8g7Htk77Ju4uvCF+kIB9GG0+14hEwDD4wR+81XmRILxDTkWgVnN5NFC+evdo4O6dwBSD8LUCDxBo1fHvfFckxvZbMO8gL/LkaVCSgWCO3eOWBTDscr4cn44IW6ZlRoqp5hUJpW6+Tu/1UzyOisAszSMdAjE3ktU+jU9q8GO+JqxJFhIp3CrtZv+3s0M/QmL+v7DEmzQzrVssXmJHfhWhAvVyBSAjKoE25SIDODTBVhqEmoHgoP6zUQ9NH0HhgVkM0Tmjv5RUbw7GEC2wfjQpkNm9aSXtjIP8heZ6lV5PapLUnt+D80PYVdh0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjejYcTSqzx5cgis9uI6sbXGhbrXJmjxT476uqYFno0=;
 b=WFaeXG+6iiF7up1mSc8/hHJ0KwgxU8VlQeYQ7XadomC46VR9WSz7l1+uk+XjOWRW5U23b3yKPFZzySAR9x8cNJJ2klu2bmaUDzjZ8R2vXuwQYkakRlCQ2m51FWVPj0SKE90nPk4v0ePXR74aXSIiff6B6+iCeRD+IUqIp5pHgHpGO4hpecudVx7xDuVjElrvTD5+ZFZkB0Fxg/r1ULWmiYuEDQ4p1dBFlnfTXL35IoFEfNSytvbEsP1xbKN0CFw/Vb1YY7aVbv+1BHEEMk0KCVpbGYmPKqchnXX1c0UQNkFkWOyrKaPxx6+rnBRxJDTjthfLquQw8AI3ohLBp2OBtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjejYcTSqzx5cgis9uI6sbXGhbrXJmjxT476uqYFno0=;
 b=rl2A3vfgy7RQYoLZaFs2sJxuhNispCPfEsiTY67M+aEVITmNbpWl8601iFO0OdGsvBuJcgUUk/wO0pdTb9+ivHsMSZBbCQtgGf7nJv6aGN+ONuTH3hXZveN6rE2OWEV8nls3GBaz4FRKilLLy9XDy4Ye1NqqeaIqDGmCYqNTo68=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:325::11)
 by TYRP286MB5152.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:111::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 15:58:55 +0000
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9]) by TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 15:58:55 +0000
Date: Sat, 31 Oct 2026 00:58:54 +0900
From: Koichiro Den <den@valinux.co.jp>
To: "Verma, Devendra" <devverma@amd.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dmaengine: dw-edma: Configure remote interrupt
 routing
Message-ID: <zbcm6tmojyywb2ioyrk3hh4eydcau5hgbybykgmktyqgkz3qhp@iwksrvlywn2q>
References: <20260912174023.1227397-1-den@valinux.co.jp>
 <20260912174023.1227397-3-den@valinux.co.jp>
 <aqgRSbIFDuMOKkzF@SMW015318>
 <muwficrvayllrqlgfrgn5rqjvwo4dxghriqzhrh6fqeu3gjrst@rla66stbftvg>
 <l4ujqwjxdolhfkqvgyxgoh4yf6c73ddpew2flyeqszpshwbox3@y7vuhyurodo7>
 <ar1wViPPc6LYi5po@lizhi-Precision-Tower-5810>
 <c135d818-ec8f-4c9c-9345-9be40675dfb2@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c135d818-ec8f-4c9c-9345-9be40675dfb2@amd.com>
X-ClientProxiedBy: TY6PR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::15) To TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:325::11)
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
X-MS-TrafficTypeDiagnostic: TY7P286MB6866:EE_|TYRP286MB5152:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c820dc3-e3a7-48a7-c8f3-08df369eb384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|23010399003|1800799024|366016|4143699003|56012099006|261009223027099003|261026130827099003|261026140227099003|261026121527099003|261026135527099003|261028144727099003|261021123027099003|261021121427099003|261021135927099003|261021133027099003|261021130227099003|261022113327099003|261022105027099003|261022075727099003|261022115727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	2f/5M99l+mWrdzzP1swXh+Qa/DBDf+geDwzkSYzvKSumSdvcwNYjIkvHD513MnHNCPH9pvdlzAlAXu6KNQlLbkOxHTD4YRGlYASi6vL5FM25ir+FvYVBOtwf1M7hTfw0943ljNzriI7KjIdq10F7C9lvhGv3KWxppXO6KrJQVRRgVqhqBLaVMqtIfPpFpCpIbGiDf3hfmAOlAXOIXrMmGyYwC5+Ew5Erab4iMofHhlICE+NoTxEON1CJ6x4+FcUgt7zNbJuVJnPzu2doVo34N8uWbtjRDF3n42HVROHK7wB7V+sL+dxZTRPprfqucayNmGmFtqy31dBGfgkIbrlKLEzbMQHKIEbEM+iLbgVcoU5B2X9hGgvc7e030LjNyvj+M08o2HhK+0n9m839A1cu3gG52LPV4hI/r9HlMl2hdBZdjZn7+9HPvNVZQUgVEJz+rRggeSVqAJ1jDQ5YMf+sXhl5AlB55k5EEFwz1SFJaeQciKBrpREwXOGNar+OYsntKCvHSisu+eu4tLhOI/pliUEBcYWvjjZqP1kfKr72ujvlx2zJMPwbTV/y7vp2M1Q3Zds6b+vXceNTJLVTueSH+fGTL6FB1Jk3pXayWSTgKY/lVz+X0fGFD5EJpTLEDaV3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(1800799024)(366016)(4143699003)(56012099006)(261009223027099003)(261026130827099003)(261026140227099003)(261026121527099003)(261026135527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261021135927099003)(261021133027099003)(261021130227099003)(261022113327099003)(261022105027099003)(261022075727099003)(261022115727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ArYR6rmo863HrSq6h5is9nXNvUS/pCsqfwowbtJa1Fx7uCtchqnKUixGbr/k?=
 =?us-ascii?Q?ejJzIG/5osTjoheyL9LHwDcGuxFML/Lf35CcWFP+CM8ccTuasSw7BuyhvzXk?=
 =?us-ascii?Q?efRyzG5qRI1UHbm/6VHuR662hZcfr5B1wZ9KLRPWHNyoK1vBmE0tcn+kW9x1?=
 =?us-ascii?Q?xs4suv31nD7iOPf3DPcSCo7tM/LtH5Y8X6f3sPEC+z3f02IhZ7DeKIeWB602?=
 =?us-ascii?Q?ABviJH8DxS7hkr7ik/O5797hQALgmuClLDsIVK0tHnRBLQuGPDzLH5hBmLpA?=
 =?us-ascii?Q?rqiQcQ6PeBAJ8GAQjSid+sXW51RPY5ZU8yuUT36o50Fe2OGdrmJCGMmlFUv1?=
 =?us-ascii?Q?QAuxAx6dqRCBk/Rf23I5oJ0rcnQu/lM6TvbJvWYN42Dc009jmPbQUq3XRzVq?=
 =?us-ascii?Q?6jRJu6NlEaKAxprpV0mPHjcbhmW5LrXIl63XQvyHHspGWK+GBE3UAyUE0dHy?=
 =?us-ascii?Q?yznBtnUD70XRpul/RNBwGni29+MjWqbebX95jj6hnm3763ssC8VSoJLO84bJ?=
 =?us-ascii?Q?/FBFbt1WPlcL/htlJSmEBoa8HggBznjdZsuDGYOJJH4rTJWcDUMG4ORhOAiW?=
 =?us-ascii?Q?1xDmrbvUzmpXnEQZZmb+aWL32NVECvNZkzUpkieA5YFIYmd5jbm+gn0shyMs?=
 =?us-ascii?Q?m5E1OHkBpwHmsNZgIyoCAOgNbC3eYXkT+YDvs/CGxUylsrgzqIdDf+SM5D20?=
 =?us-ascii?Q?gDPCxPHHh3wyvP8A9gcHl5D875FFhopdfOTJp7S4ZXGTzhynCZw87V/BSaQg?=
 =?us-ascii?Q?dLiajqU1DQbOvOMaxAYsqOCzrCCZdeBZsmRqio0OWtPEah3+m2lBoOKWuvos?=
 =?us-ascii?Q?T1rhRWo69KUZd2CQDt23oRWnMDe/X+ecIhGMNXB7mFS6UI/hK1qPRAyJxdA0?=
 =?us-ascii?Q?7XM4Js/+3MLwgOH2R4QVCp1y5Sfy7rCBD34iVBypCoojiNL+ykni0I7QlMU+?=
 =?us-ascii?Q?ov0uxeHozdyEiDVvHS2DTbeEp2EUJYgQWQvy1EzJADUbSFwJkMirErSjJpE0?=
 =?us-ascii?Q?216lZP6DkDZ4fEDAAE01t3DjGYm/46MmOtXvHT91Leg/rXVEufzybD84ocKc?=
 =?us-ascii?Q?+TDy9S6FjB85kLv+K0QkdjkSqZKuM6qRcYR6iHP8D01ChxpT8ho1sFHPORWd?=
 =?us-ascii?Q?FagHuAMN81KZa/ehVcfipoC5dfwkEeyaJWpZSiRPaTBNmOKTw6P+WcHblWJX?=
 =?us-ascii?Q?iuTKZiR6cC1Xrnk5KQj7cqLACS8khsC5xX1m6r8p6PZ0zf2A6/8qoONsPWvn?=
 =?us-ascii?Q?RE4NdiS12v9fjrXOSRuJEX75bESybcN7hoX79todk3nx6VVHhig/OBO6sZGd?=
 =?us-ascii?Q?puOoAip2W8n7D0WCXgAba6afIuvC0HEoPph1MgljEVW1jGsJkGP82O+0J4+h?=
 =?us-ascii?Q?4od5IM1ZBlJmUZ/qQQwYEdVYdjyKqCkNhd5w9ajRD+2U8D4XDIti04tEF85q?=
 =?us-ascii?Q?s88laRktOJ/iftdtPHjQZtDt+4rQ95RpFBi+Krzyjk3yc2yV7dZRvdTIt5vd?=
 =?us-ascii?Q?zNHUIhOpX2KPOn04PVF9QF35QLO9iPDT6sn2Uel8+LeNbkRnAVRp5SSufSgx?=
 =?us-ascii?Q?jXAcduAEc7YxKia8BcGK6t0dxURruK7CAiivbIKKfptFnk2b+/WqIn1XCPz9?=
 =?us-ascii?Q?WRNtmyhm6QxJzD3WLMyh79dHmq+YoCQPFLFnQXg50Llaco+Kher2xXdJFJnP?=
 =?us-ascii?Q?/XnaDthqEo1yWY3/+Weg6bTggFk943Epf1/OrE1u5hOme43xdne9gOdBIfHG?=
 =?us-ascii?Q?P6Sq9kD2CEK40NBIOnkpBKhnI3h26ncrmyT6qhqx8JC+fUDayc7S?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c820dc3-e3a7-48a7-c8f3-08df369eb384
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 15:58:55.6437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Sbp+x6ERG1cN8orWJcJ7zlIHzv206bSv2lJoteWurvTr3RTCBsVGoU/YVtAPXmjRIF5/5Qwl77Y6cgTSSXBTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5152

On Thu, Oct 01, 2026 at 11:37:44AM +0530, Verma, Devendra wrote:
> On 01-Oct-26 01:55, Frank Li wrote:
> > On Tue, Sep 15, 2026 at 12:53:33AM +0900, Koichiro Den wrote:
> > > On Tue, Sep 15, 2026 at 12:49:01AM +0900, Koichiro Den wrote:
> > > > On Mon, Sep 14, 2026 at 10:22:49AM -0500, Frank Li wrote:
> > > > > On Sun, Sep 13, 2026 at 02:40:22AM +0900, Koichiro Den wrote:
> > > > > > An endpoint function can reserve an endpoint-local channel while the RC
> > > > > > programs it through an exposed register window. Such a channel must route
> > > > > > interrupts remotely and ignore them on the endpoint.
> > > > > > 
> > > > > > Use dma_slave_config to set per-channel interrupt routing on idle channels
> > > > > > of a local eDMA or HDMA instance. Releasing a remote-routed channel
> > > > > > quiesces the hardware and drains its local IRQ before restoring default
> > > > > > routing.
> > > > > > 
> > > > > > The eDMA quiesce may stop a complete direction. The caller must own every
> > > > > > channel in that direction and stop remote programming first.
> > > > > > 
> > > > > > Suggested-by: Frank Li <Frank.Li@nxp.com>
> > > > > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > > > > ---
> > > > > > Changes in v4:
> > > > > >    - Drop unnecessary READ_ONCE()/WRITE_ONCE() for irq_mode. (Frank)
> > > > > >    - Allow repeated dmaengine_slave_config() calls on idle channels
> > > > > >      when the IRQ mode is unchanged. (Sashiko)
> > > > > >    - Simplify IRQ mode handling, assuming the channel has no pending
> > > > > >      interrupt status when its mode changes. Treat racing reads by
> > > > > >      shared IRQ handlers and same-value stores on release as harmless.
> > > > > >    - Support native HDMA.
> > > > > > 
> > > > > >   drivers/dma/dw-edma/dw-edma-core.c | 136 ++++++++++++++++++++++-------
> > > > > >   include/linux/dma/edma.h           |  21 +++++
> > > > > >   2 files changed, 125 insertions(+), 32 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> > > > > > index a678c70a78fe..c978da30bac5 100644
> > > > > > --- a/drivers/dma/dw-edma/dw-edma-core.c
> > > > > > +++ b/drivers/dma/dw-edma/dw-edma-core.c
> > > > > > @@ -177,48 +177,76 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
> > > > > >   						  DW_EDMA_CH_IRQ_REMOTE;
> > > > > >   }
> > > > > > 
> > > > > > +static int dw_edma_device_config_irq_mode(struct dw_edma_chan *chan,
> > > > > > +					  enum dw_edma_ch_irq_mode mode)
> > > > > > +{
> > > > > > +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) ||
> > > > > > +	    (mode != DW_EDMA_CH_IRQ_LOCAL && mode != DW_EDMA_CH_IRQ_REMOTE))
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	guard(spinlock_irqsave)(&chan->vc.lock);
> > > > > > +
> > > > > > +	if (chan->status != EDMA_ST_IDLE || chan->request != EDMA_REQ_NONE)
> > > > > > +		return -EBUSY;
> > > > > > +
> > > > > > +	/* IRQ routing cannot change after the initial configuration. */
> > > > > > +	if (chan->irq_mode == mode)
> > > > > > +		return 0;
> > > > > > +
> > > > > > +	if (chan->configured)
> > > > > > +		return -EBUSY;
> > > > > > +
> > > > > > +	chan->irq_mode = mode;
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > >   static int dw_edma_device_config(struct dma_chan *dchan,
> > > > > >   				 struct dma_slave_config *config)
> > > > > >   {
> > > > > > +	const struct dw_edma_chan_config *dw_config = config->peripheral_config;
> > > > > >   	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> > > > > > -	bool cfg_non_ll;
> > > > > > -	int non_ll = 0;
> > > > > > -
> > > > > > -	chan->non_ll = false;
> > > > > > -	if (chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE) {
> > > > > > -		if (config->peripheral_config &&
> > > > > > -		    config->peripheral_size != sizeof(int)) {
> > > > > > -			dev_err(dchan->device->dev,
> > > > > > -				"config param peripheral size mismatch\n");
> > > > > > +	bool non_ll = false;
> > > > > > +	u32 flags = 0;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	if (dw_config) {
> > > > > > +		if (config->peripheral_size != sizeof(*dw_config) ||
> > > > > > +		    dw_config->flags & ~(DW_EDMA_CH_CONFIG_NON_LL |
> > > > > > +					 DW_EDMA_CH_CONFIG_IRQ_MODE))
> > > > > >   			return -EINVAL;
> > > > > > -		}
> > > > > > +		flags = dw_config->flags;
> > > > > > +	}
> > > > > > 
> > > > > > -		/*
> > > > > > -		 * When there is no valid LLP base address available then the
> > > > > > -		 * default DMA ops will use the non-LL mode.
> > > > > > -		 *
> > > > > > -		 * Cases where LL mode is enabled and client wants to use the
> > > > > > -		 * non-LL mode then also client can do so via providing the
> > > > > > -		 * peripheral_config param.
> > > > > > -		 */
> > > > > > -		cfg_non_ll = chan->dw->chip->cfg_non_ll;
> > > > > > -		if (config->peripheral_config) {
> > > > > > -			non_ll = *(int *)config->peripheral_config;
> > > > > > +	/*
> > > > > > +	 * When there is no valid LLP base address available then the
> > > > > > +	 * default DMA ops will use the non-LL mode.
> > > > > > +	 *
> > > > > > +	 * When LL mode is the default, clients can request non-LL mode
> > > > > > +	 * through DW_EDMA_CH_CONFIG_NON_LL.
> > > > > > +	 */
> > > > > > +	non_ll = chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE &&
> > > > > > +		 chan->dw->chip->cfg_non_ll;
> > > > > > 
> > > > > > -			if (cfg_non_ll && !non_ll) {
> > > > > > -				dev_err(dchan->device->dev, "invalid configuration\n");
> > > > > > -				return -EINVAL;
> > > > > > -			}
> > > > > > +	if (flags & DW_EDMA_CH_CONFIG_NON_LL) {
> > > > > > +		if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE)
> > > > > > +			return -EINVAL;
> > > > > > +
> > > > > > +		if (chan->dw->chip->cfg_non_ll && !dw_config->non_ll) {
> > > > > > +			dev_err(dchan->device->dev, "invalid configuration\n");
> > > > > > +			return -EINVAL;
> > > > > >   		}
> > > > > > 
> > > > > > -		if (cfg_non_ll || non_ll)
> > > > > > -			chan->non_ll = true;
> > > > > > -	} else if (config->peripheral_config) {
> > > > > > -		dev_err(dchan->device->dev,
> > > > > > -			"peripheral config param applicable only for HDMA\n");
> > > > > > -		return -EINVAL;
> > > > > > +		non_ll = dw_config->non_ll;
> > > > > > +	}
> > > > > > +
> > > > > > +	if (flags & DW_EDMA_CH_CONFIG_IRQ_MODE) {
> > > > > > +		ret = dw_edma_device_config_irq_mode(chan, dw_config->irq_mode);
> > > > > > +		if (ret)
> > > > > > +			return ret;
> > > > > >   	}
> > > > > > 
> > > > > > +	chan->non_ll = non_ll;
> > > > > >   	memcpy(&chan->config, config, sizeof(*config));
> > > > > >   	chan->configured = true;
> > > > > > 
> > > > > > @@ -890,11 +918,53 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
> > > > > >   		 "timeout waiting for channel termination\n");
> > > > > >   }
> > > > > > 
> > > > > > +static void dw_edma_synchronize_chan_irq(struct dw_edma_chan *chan)
> > > > > > +{
> > > > > > +	struct dw_edma *dw = chan->dw;
> > > > > > +	unsigned long *mask;
> > > > > > +	int i;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * A shared handler may retain this channel's status across quiesce.
> > > > > > +	 * With nr_irqs == 1, it scans both directions even if routing and
> > > > > > +	 * delegation are direction-wide. Drain it before allowing a routing change.
> > > > > > +	 */
> > > > > > +	for (i = 0; i < dw->nr_irqs; i++) {
> > > > > > +		mask = chan->dir == EDMA_DIR_WRITE ? dw->irq[i].wr_mask :
> > > > > > +						     dw->irq[i].rd_mask;
> > > > > > +		if (!test_bit(chan->id, mask))
> > > > > > +			continue;
> > > > > > +
> > > > > > +		synchronize_irq(dw->chip->ops->irq_vector(dw->chip->dev, i));
> > > > > > +		return;
> > > > > > +	}
> > > > > > +}
> > > > > > +
> > > > > >   static void dw_edma_device_synchronize(struct dma_chan *dchan)
> > > > > >   {
> > > > > >   	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> > > > > > +	bool remote;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * irq_mode is fixed after initial configuration. The free path
> > > > > > +	 * restores it only after synchronization.
> > > > > > +	 */
> > > > > > +	remote = chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL &&
> > > > > > +		 chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Peer-driven transfers bypass local descriptor tracking, so quiesce
> > > > > > +	 * the hardware explicitly.
> > > > > > +	 */
> > > > > > +	if (remote && dw_edma_core_ch_quiesce(chan))
> > > > > > +		dev_warn(chan->dw->chip->dev,
> > > > > > +			 "failed to quiesce remote-routed %s channel %u\n",
> > > > > > +			 chan->dir == EDMA_DIR_WRITE ? "write" : "read",
> > > > > > +			 chan->id);
> > > > > > 
> > > > > >   	dw_edma_wait_termination(dchan);
> > > > > > +	if (remote)
> > > > > > +		dw_edma_synchronize_chan_irq(chan);
> > > > > >   	cancel_work_sync(&chan->irq_work);
> > > > > >   	atomic_set(&chan->irq_pending, 0);
> > > > > >   	vchan_synchronize(&chan->vc);
> > > > > > @@ -907,8 +977,10 @@ static void dw_edma_free_chan_resources(struct dma_chan *dchan)
> > > > > >   	dw_edma_device_terminate_all(dchan);
> > > > > >   	dw_edma_device_synchronize(dchan);
> > > > > > 
> > > > > > -	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> > > > > > +	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
> > > > > >   		chan->configured = false;
> > > > > > +		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
> > > > > > +	}
> > > > > > 
> > > > > >   	vchan_free_chan_resources(&chan->vc);
> > > > > >   }
> > > > > > diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
> > > > > > index 3c8e2ef9dee0..43831fa57357 100644
> > > > > > --- a/include/linux/dma/edma.h
> > > > > > +++ b/include/linux/dma/edma.h
> > > > > > @@ -101,6 +101,27 @@ enum dw_edma_ch_irq_mode {
> > > > > >   	DW_EDMA_CH_IRQ_REMOTE,
> > > > > >   };
> > > > > > 
> > > > > > +#define DW_EDMA_CH_CONFIG_NON_LL	BIT(0)
> > > > > > +#define DW_EDMA_CH_CONFIG_IRQ_MODE	BIT(1)
> > > > > > +
> > > > > > +/**
> > > > > > + * struct dw_edma_chan_config - dw-edma channel configuration
> > > > > > + * @flags: fields selected by DW_EDMA_CH_CONFIG_*
> > > > > > + * @non_ll: use HDMA non-linked-list mode
> > > > > > + * @irq_mode: interrupt routing mode
> > > > > > + *
> > > > > > + * Pass this structure through dma_slave_config.peripheral_config. Before
> > > > > > + * synchronizing a remote-routed channel, the client must stop remote
> > > > > > + * programming and own every channel affected by the hardware quiesce: the
> > > > > > + * entire direction for eDMA-compatible layouts, or the individual channel for
> > > > > > + * native HDMA.
> > > > > > + */
> > > > > > +struct dw_edma_chan_config {
> > > > > > +	u32 flags;
> > > > > > +	bool non_ll;
> > > > > > +	enum dw_edma_ch_irq_mode irq_mode;
> > > > > > +};
> > > > > > +
> > > > > 
> > > > > Do you have any user in kernel tree use non_ll?
> > > > 
> > > > I don't think so.
> > > > 
> > > > Devendra, I would appreciate your input here, if you have any thoughts on
> > > > Frank's question, or the new dw_edma_chan_config. I haven't found any in-tree
> > > > user of the non-LL peripheral_config interface introduced here:
> > > > https://lore.kernel.org/r/20260318070403.1634706-3-devendra.verma@amd.com/
> > > > so I guess any users would be out-of-tree at least as of now, unless I'm missing
> > > > something.
> > > 
> > > Ouch, I meant to put Devendra in To, not Cc. Sorry for the noise.
> > 
> > Consider not in-tree non-ll consumer. It should be fine to change API.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > 
> 
> Hi Koichiro, Frank
> 
> Thank you for your patience!
> I was out for few weeks. To your question, there are no users in
> the kernel tree for non_ll case via the dmaengine_slave_config().

Hi Devendra,

Somehow I missed this. My apologies for the late response,
Thank you for the confirmation!

Best regards,
Koichiro Den

> 
> - Devendra
> 
> > > 
> > > Best regards,
> > > Koichiro
> > > 
> > > > 
> > > > Best regards,
> > > > Koichiro
> > > > 
> > > > > 
> > > > > Frank
> > > > > 
> > > > > >   /**
> > > > > >    * struct dw_edma_chip - representation of DesignWare eDMA controller hardware
> > > > > >    * @dev:		 struct device of the eDMA controller
> > > > > > --
> > > > > > 2.51.0
> > > > > > 
> 
