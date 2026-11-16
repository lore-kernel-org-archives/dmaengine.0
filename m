Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794860847;
	b=PWqFMnPrgdk1w12t3pGJ98Wrqu7xG1S3Jv6Fr+j+bDcT2IiUsSafHJyrpbZufJTcB7aE
	 SAZ8rVjSQKZl2uv1dBjZTSMiXSqkA4p9CNMip/dyFl4wrveEE7rXdzT7JRAgT+LmrMpmn
	 uWygGULP6yot3T+wFMeT0vi1oPE6X7feVrz/21o5yqnpXr9G+u/E2K04JL+o9PajjadPU
	 JrRSMbI8B0ea1wolwhiS18Q25+s/gssqdZHRI0JI+gt1dXAt7AG3K0b/KUPjLwjd+nR7g
	 RSj3bZjUV23K02rxjGpOiBQQtqIxmc+9B+WdK6/wLNa+g0ERM37lP/EtGIQj1lkukaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860847;
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
	bh=oxlzDZUewyf90xlp0bwWexZX1WyrzT6jh/i+ADOpMY4=;
	b=txPJY/AdwZOGqd5JT0TaZo0GKveXAp76YHoUq46UZ/58Uold7J6GQ+wY9Gpmaoq3+xgL
	 qYeE/Jo5T8zn/+JqBT1EKemhYg4HJeQbpN1m8k32GHLo/FoYQwhrcIINI7XgGuHrCiAff
	 PuC4cKH/7GeCQYgCfFS2Lpqgl31PGUrw1TmE14An2jK8kFRnM2sMzRmou4lj3+PkNSI6g
	 5X2XCc8pund0FawR9gTPFkzRcWv/4XWeaUHnk/8dMLVCyf37X4lXF8mtRCvPISEiu9Xwi
	 SWMPOOjpLYxjApRih0QVDpZeQrIeUBkygcNOeDF47U07dVqoJBFy8+Rpe1/J6lb3jcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gfAxAoOo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.5
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010005.outbound.protection.outlook.com [52.101.84.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CB6606A333;
	Mon, 16 Nov 2026 20:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6CB6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gfAxAoOo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=By/R6iS7DwiAPdAtClMP8Qk56bfKtfMYZntkdXPZSiDJiyH9a+HK0V4cABxgoyQMx5spSHMlEP3++H/GsngenRGkG7Yw9amDLodn/5h0ygenzt2fCZvFjLEx3AYiy5JUTkXeXii//LFZdgxHNq0448zVsVxUZ9w3/kMdlzL+4nmW/Uxe/GaFmdZxmdspSZCJGH6WNQ54RNT4lPlX9p/C5PLsX8jC0J/dxqKlKwX8B85o17w2vIh6FKz74SUwTpNNtwbWudSqIyM2Et8p6IOV6uZrZhI6J05SCh99XCAd3lsbVE7w66fA/fJH1mNPj/QDnElP8bDlOKXXVxHuwq0t8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxlzDZUewyf90xlp0bwWexZX1WyrzT6jh/i+ADOpMY4=;
 b=wY3PYYgdHO/ZohgGU15A9o3+aVuFYXdVrtfZGaZ4K1ddbzyUCFFtigrWCisvd0jQhguIF9XEmih8RZBUS9nzlh/vp6n+3HQNHw9Ydktlmg0KweZslu/AwrnGPU0+euSvG5Df+omhF0kuVkvP/mbQOSy9G91FR/Byzuu1EjLRW4RjFDrXsUJMfxDCragqLzkAo9Yex8YyN+AQgaWMBHjMFFd2Hf1xni3ixYOBjrEZoY79MBvI8K7Hh1f3umlDVQx3c5FEs7/zWzDWUKMfr3kJTStDwFrTVee50LKE/VdUuSa34Di3z4UGNeTDWjtZrLEze1kirgw9qe6PaG3eHjMb2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxlzDZUewyf90xlp0bwWexZX1WyrzT6jh/i+ADOpMY4=;
 b=gfAxAoOoVWER8lG1ZKnxm3FiCEVI2ahPrbk3rXZGKSkEbgRXZ1tj4GyGwS5IS4bbRA2Pd75EOcENdN7i8wkb0y+746KarpPgvQGAAT4gWr/RC5PG31HFtHvEWHvyqu2uf20P9C8Sw8dhdtlK5UVVukVFW6O/UFoZEBLnHYGyPX/mr40s2wOT5FzaRlbxTaUoB6kYMDM0yQZcqUbRjCEuseSIE3egw/U9M1Wm6SJwzFn0QpiZ4CZN279XDkfipgo2UAyp3E+2WcWYPgrtipHM/tDjS5OXF3Ad5fmiAT7pRRpulvpl8TKwL7W53kJq7ZJ3GX9tbR0ijHGHYJGeeaS2OQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8996.eurprd04.prod.outlook.com (2603:10a6:20b:42f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 20:27:23 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:27:23 +0000
Date: Mon, 16 Nov 2026 14:27:15 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: David Yang <mmyangfl@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dmaengine: pl08x: Use the channel count from the
 device tree
Message-ID: <avtnI3Xn9xVp6aVX@SMW015318>
References: <20261106072602.77560-1-mmyangfl@gmail.com>
 <20261106072602.77560-3-mmyangfl@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106072602.77560-3-mmyangfl@gmail.com>
X-ClientProxiedBy: PH8PR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: 0986fffa-9eb1-4aa3-1069-08df442005c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|19092799006|261026121527099003|10067099003|11063799006|4143699003|56012099006|261021133027099003|261021123027099003|261021121427099003|261009223027099003|261021130227099003|261021135927099003|261026135527099003|261102123227099003|261022105027099003|261026140227099003|261026130827099003|261022113327099003|261022075727099003|261022115727099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5sHukqQKtQuiWMHf4d3pSvsIat0JJA9zN7WuW4gw+AyjstDqBLDSc+ZjBS7fvl85mXAwSYl6y0l4+6eqQGmrFMZ4qj48QiVFt5L+ydi3FLKXfTz6P4fjCSif/yAiRrb24Cq6JNQb7hZch+ebzAgBCNXx3k5eOw0puz7hZ4tkzM85KD3ahc8jPyK1HbTp5Kf9FVz6MvDPI5ydHrAEtkpPLHoMuP6wwNdxdlN2jsPwbGWXw/Hi1Vcq0DiRIeRAoIVEEgHFRIXH4LuKQXGVpS9fZh7oAJzL4FqPG7w9bqY3gEFxA5oHJC+JDdyeZV/P6Yrdy+vpl3NuZKniwRP3sOONsZ+Q1J6glk621ENbm+XXaotiJmcHuktAcZDab38Nx7pAGJSFNHbAG8kHuOcKNJQp+ghO8f97GUEqitZOlMGEfyBkWWitDAH6LUNhHHcJ8rWAty39AnvtvntK/QhIP+meE+zgVyxWQ1BSx0ngPr+6496S71XQtlSfdO6bIez84eXi74/rvRovknMdhsq/Xd4Z4sPAQXQUJKbY7P9aeo/5LyAk2p7BKC00NrVScS8kP3TzLqn2bv8uGkdIcCmBaZDs35pBtQuyGcou5rENbzi4eFsGKb4u9qM5AhC9pzXgbP1idVjkopzgdAIM9A+ACsbBneQZcWinP40aX1RVGw0dILo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(19092799006)(261026121527099003)(10067099003)(11063799006)(4143699003)(56012099006)(261021133027099003)(261021123027099003)(261021121427099003)(261009223027099003)(261021130227099003)(261021135927099003)(261026135527099003)(261102123227099003)(261022105027099003)(261026140227099003)(261026130827099003)(261022113327099003)(261022075727099003)(261022115727099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VySTF0Vqi3xOC1ti8elfovHrNTEVWaojMtm59Xq59J0PSO2T/xFpDPLpr6V2?=
 =?us-ascii?Q?UEPn4T7z23ipwk00PfldfbebnsTCZ6LwTe+AQksuKVbR3BPmDzsxAlkTv6pG?=
 =?us-ascii?Q?189pwBkXpd5WiH+Jby19w0PK4AtjlgS++T+Rd0G1FX8HHMjbRX/jI3hhSHw4?=
 =?us-ascii?Q?xBPjiyBwu8S0RvMFNG/M1FE4Pt04z42dmyHAQ21S45p/TBNiAgLOEaT+Ws/M?=
 =?us-ascii?Q?OMoPVwVap9+OASZkKq9goJAP9TMkUiO9K5Z99SgYy+r/b04OhwP0n35YTOGE?=
 =?us-ascii?Q?Hw16rKwJbQnGWlVza2NjRQx8V5E8c04ZHefjVxXy/naLC6sjYuC88t42OL6/?=
 =?us-ascii?Q?NpZTw0Nh+mnrR+22NrCEAMJBZIALNoxobJPuFbesea/U/7DVWHo3vZpTbWi3?=
 =?us-ascii?Q?qw+iX5ViH74Q5Lbzr3CFkcU4bWDVG9PBO9iqB0K3k0BEZMzvkVuFOD/SacaS?=
 =?us-ascii?Q?czdm+//iq33NHik9iykDB/bBbs+yW2DMhH6PtVFSoViGk3ms/X2blJYjeik7?=
 =?us-ascii?Q?Yggpdu8u53Qs6X5rxuyKTHhApxAvRkLtJXlkDl21yzjwlEmsOB5W1p97Juhe?=
 =?us-ascii?Q?HHnaNAtPDhCSJ6cPCQksPozUNJhH1biI4xxhbl7zytXXPoQxU2CeMLUUDid9?=
 =?us-ascii?Q?3DKgTzDs6jIPD/WlzHOkYu/VgGKZjT8tgqUU2ihnZqlWUINXhl1wscgYXG8b?=
 =?us-ascii?Q?J6qLORVoJUeC0BsvQqIiAv0/VHjiEkAeJAZJPa/FQhsjiSqv/2rlmMM+DCnM?=
 =?us-ascii?Q?lsV42jabrwxkEY4IyKxciemyShGwIX8J35OmqVuEKafFuugY+QopUOnmBh4D?=
 =?us-ascii?Q?6pLo4yX0G2RpJszCwd9KK7TDSDIX+3XAjP+V7Cf7d97t/pqjsE9XA9FFovEY?=
 =?us-ascii?Q?oKO3zL+YPMBP5hCJX3WlhitsSlSqYHSBkmhfjtXlCCXks1UZoTcl85ujlV4n?=
 =?us-ascii?Q?MUDISoagilgjFROIKS6SeASyipMuFjhkiHppvvnKZ8lvebMycCnGlJwutfI3?=
 =?us-ascii?Q?xImsFRDRrnfa5y9OgovNRbj3iNOrjyJnvFLFDbpdMaWaHKgLzFRGJJCgdLoX?=
 =?us-ascii?Q?LqZUMmieZnfHedg7zskbhqN1Fld0GNGlFDA7RbFu5vyKiJQk5UrykMEQsh16?=
 =?us-ascii?Q?YsWonQ0nwGJrBQobiL0MJnHSDwckp/udgGcY9voeQtcpkOav+Fi8i6kULmQT?=
 =?us-ascii?Q?9zEUh0ArELFCGySJObTaBNKWzM5FEy99O4ObFLrDOj7z1D+d5JZtH7TWYwbt?=
 =?us-ascii?Q?zgpRKZBoqcG1U6hamEOQ6fGnb+uHe14h5+tbG25JZe5IiYHlPrMTsGpJ3JHe?=
 =?us-ascii?Q?BfIfppH7sAO2b+K2oBtIW+iJmN61WVVGbeAn7xjPZd7Rl/NhKke3P1qGJDUK?=
 =?us-ascii?Q?6fob3cp2Ab31wbEznorAIeoSORhwWsMJyFBGV7AgDjnKHKsx9/XVANX1FXpg?=
 =?us-ascii?Q?S66tm+7IptocJRyXnIRCMI+1X3nNoQIFjMcy01yI2PF+kfV9alqZMxOsZEc5?=
 =?us-ascii?Q?sFOFPy7etA+5OyFbKI5VDdcTBvGmSxuAMElSELcr/oSjqQdwTZsLk1SuWK9J?=
 =?us-ascii?Q?MDyF43Qh66hTutTpYt+H6Korq9UidFANPeJI8hcPQx71KfXskAZVOOnTHYLD?=
 =?us-ascii?Q?3F6Bv9vIwjGzLmK8psTpQyenGz2YpnjahfI0zIoVERyCHBeZF7TnavcGfbBf?=
 =?us-ascii?Q?wSA670y/7OQyqBKVkh8kA46CmInemvVa+omuwkW4OKZf4Pczb+SMcuUfznBG?=
 =?us-ascii?Q?XVWJUd2r3JYl1ENkFJSDf5PQH+pw4+KbsnTTba5UYQS4uF6fhNta?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0986fffa-9eb1-4aa3-1069-08df442005c8
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:27:23.8140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AF6jLUCceVxKJFeLXDhpfj7h3bt7oCYknAW/oqZkRxgM8KoXkmkqk3z9iR2cErPL24gFiJsgO+X1q6IIN2Ys50K32O9I4QB5PvNHuucNKxJYvhxPOUFLXL5ctfsnacEv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8996

On Fri, Nov 06, 2026 at 03:25:59PM +0800, David Yang wrote:
> [You don't often get email from mmyangfl@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The Hi3798MV100 DMAC is a plain PL080 except for the channel count: 4
> instead of 8. The part ID does not say, and the driver takes the count
> from the matched vendor_data entry. The entry is shared between
> instances; the adjustment lands in a private copy. dma-common.yaml
> already defines dma-channels for a controller node. Honor it.
>
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/amba-pl08x.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
> index 9f5e4f5fb877..27c61a7f2082 100644
> --- a/drivers/dma/amba-pl08x.c
> +++ b/drivers/dma/amba-pl08x.c
> @@ -282,7 +282,7 @@ struct pl08x_driver_data {
>         bool has_slave;
>         void __iomem *base;
>         struct amba_device *adev;
> -       const struct vendor_data *vd;
> +       struct vendor_data *vd;
>         struct pl08x_platform_data *pd;
>         struct pl08x_phy_chan *phy_chans;
>         struct dma_pool *pool;
> @@ -2698,6 +2698,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
>         struct device_node *np = adev->dev.of_node;
>         struct reset_control *rst;
>         u32 tsfr_size;
> +       u32 channels;
>         int ret = 0;
>         int i;
>
> @@ -2719,7 +2720,6 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
>
>         /* Assign useful pointers to the driver state */
>         pl08x->adev = adev;
> -       pl08x->vd = vd;
>
>         pl08x->base = ioremap(adev->res.start, resource_size(&adev->res));
>         if (!pl08x->base) {
> @@ -2727,6 +2727,17 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
>                 goto out_no_ioremap;
>         }
>
> +       /*
> +        * vd points into the shared id table; give the instance its own
> +        * copy before anything below starts adjusting it.
> +        */
> +       pl08x->vd = devm_kmemdup(&adev->dev, vd, sizeof(*vd), GFP_KERNEL);
> +       if (!pl08x->vd) {
> +               ret = -ENOMEM;
> +               goto out_no_platdata;
> +       }
> +       vd = pl08x->vd;
> +
>         /* Release the reset before reading registers */
>         rst = devm_reset_control_get_optional_shared_deasserted(&adev->dev, NULL);
>         if (IS_ERR(rst)) {
> @@ -2756,6 +2767,16 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
>                 vd->dualmaster = !!(val & BIT(9));
>         }
>
> +       /* Read the channel number from the node if specified */
> +       if (!of_property_read_u32(np, "dma-channels", &channels) && channels) {
> +               if (channels > vd->channels)
> +                       dev_warn(&adev->dev,
> +                                "using %u channels, instead of %u from the node\n",
> +                                vd->channels, channels);
> +               else
> +                       vd->channels = channels;
> +       }
> +
>         /* Initialize memcpy engine */
>         dma_cap_set(DMA_MEMCPY, pl08x->memcpy.cap_mask);
>         pl08x->memcpy.dev = &adev->dev;
> --
> 2.53.0
>
