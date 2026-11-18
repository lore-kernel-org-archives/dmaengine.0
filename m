Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795032378;
	b=L38NWvBbdsxUL0N/+uY8Rdhya0mC/3ys1zgQpGbmxFzaX1D5vecYHjcBxrMhDq1GGili
	 wum7IjK2sFM9E5BzIE179SOq69d/oldDL9Sr/nG2zFi757DNl1vAujWEuelovP/EWsepm
	 XZ6F2ipt0yuTg9htqVPIL6vEE7fX42y+2DORIwwQSMldjuQzz8FmitblJgJ+1w2ACGEza
	 z54RGHKsibgvgSFqkM1YsvWHbtKiJkh9WIi2bb1hCyiU2DMcdGeMZs+3jTZJiF+IdMwOQ
	 2VuX/i9GSHfIl9p+0cmzHxV8qZ1GKLkDUDPfr7W9YF9QF/zDPWMt4q1+gDeltkdNkMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032378;
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
	bh=yZU6BDr8Q24NaiNn/+kRvgie1wIu4r/SpBuMdh5tIBY=;
	b=NsjwXRmyFU/CGKGIl9aNAGjZGGyJNaHwXsY6TBWJdVMSBxizT74KTzmo4g3hgtCq3h2H
	 UqSWZJckr4YUdV8UrFV4SdBkHi9NUo8FoRPiSkNjDSJ2O18MF6/WMMQGkz3lZYp0SeQzj
	 hAXe9ArxyIpyky2Op+43J/W2ahJDG9axLJoZdT/eQ1x7bYLf8LpZ2jPZWnHKOi998A0qw
	 CsxYmezb3uIbbf5XoZN4oYynJtvmk0/T/UoWfW2fJr9RNwEhNuybAnBZ3+N+uH8v3rQlZ
	 ihGIth2g2/R6Fi+DWMr0BH1+oirJ7VxdiL5NtOFRZV9ASYhJzY/AhjSWSo4TOKUU/NQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SbB8dUf2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.12
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013012.outbound.protection.outlook.com [40.107.159.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A32E606A338;
	Wed, 18 Nov 2026 20:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A32E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SbB8dUf2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hyhpq8t+i2bzFmi5/VJMoOrhED15aZNm4zT1eQOtsutGwoxEybcW5uLMiOVyLrqNSUU40O8BL9FDnJDn/bYR+qju7ftCu16vA8MyFrDU6vmHI6PpMBXcMySVVPlBv49kuWhiTF0t1JeyBHEh2CbC9zqToRDRlGlwH/ciqpGQi7vOnW40ua7VtXdL/QRcUC0T+OLG0P4st4e8DjXhYOP8QJRFau47GZSBOJqkBZa2kxRtKkOUw+rOnOxptUiVmC7/Xd8Vgw/uO9K15aQdULO4qRqNIWnYQt//hmBsuMiVLxNDh7gXtNQsD6nxAhMcRwBERcamZHPAMI0Cp8JTq89KOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZU6BDr8Q24NaiNn/+kRvgie1wIu4r/SpBuMdh5tIBY=;
 b=GNvE+4E1pjivma9wxit0Kr8xZvCkCFtUqbUvCGteWh99gh2nxGS/ZoiqbkT1XCI5wLRGJHO11FUqZNig+0/ujBq9bCKnAubTpDYxO4RXKQx9H+Rg5XtJMlxJ1g5JKidMZVp2AiGr/gk6BxpXjIY80Qj8EEzUwpTnzstS1TIRb9+49F/c0yfYs4XXq93EmjTIsk/Czd1sEk05WSVjOOQZkkVMMQs8q40P+B+XohvBJrYU+J1ojK+nwa72RYWTb3xUDTSfCAZJEnvUnaMWimQBbezJoDoWuncvlmklFfnpePJtyzoo6FUGMTlj2tXmXcbN0S5lWkbZaOywyfZdKDIeTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZU6BDr8Q24NaiNn/+kRvgie1wIu4r/SpBuMdh5tIBY=;
 b=SbB8dUf2VQWSAp0nk+fYlwrJacaEd+gtaV7r3trEm9brNKFEMy1gya8561C2HPRBlBwlGPrI6JmklnvJlb3lzwneVc8tPUIy4QBz4Qx3S5DQZlzXkdbYQOx5HLGJmZJSBh/HMSxLhWRrfRCbJ3KRhD9D4QeHeMzcHROWum0RJ/YNZC6MEi50p9I1qlnn7AKAkmZr3zI+ODUpTbQdL0KhSNfD/MPhjZxmuphpNbtblxzxXiNomIdGarDeD2Pk6MAlCHnLUTZ+lXD8MYnM2ewdaNy2Zz7nYFHBTR3r2/y82x+q9gIngcc7rj/NfhbI+3QbRqrABR0H7wJo6vUXpDyK8w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVUPR04MB12442.eurprd04.prod.outlook.com (2603:10a6:150:346::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 20:06:14 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 20:06:14 +0000
Date: Wed, 18 Nov 2026 14:06:04 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Ripard <mripard@kernel.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Jean-Francois Moine <moinejf@free.fr>,
	Hongling Zeng <zenghongling@kylinos.cn>,
	Chengfeng Ye <cyeaa@connect.ust.hk>,
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 2/9] dmaengine: sun6i: handle the last partial
 interrupt bank
Message-ID: <av4FLBN3RchJnZKS@SMW015318>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
 <20261115-submit-sun6i-dma-lifetime-next-v1-v4-2-043cd476a45f@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-2-043cd476a45f@gmail.com>
X-ClientProxiedBy: PH7PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:510:339::31) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVUPR04MB12442:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fe1194b-bb85-42ba-bd4b-08df45af6610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|7416014|18002099003|22082099003|261021121427099003|11063799006|56012099006|261028144727099003|4143699003|261022105027099003|261026140227099003|261026121527099003|261021123027099003|10067099003|261102123227099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	CXNHJDkM+L14eimOy65JFdVhKK1Zf3qS9q6rAy0N3P8hMbJodZaVwmrJIVeAhI/AI+27t3ppCLO5e15jyLOskixkb96sI0r9j8uQpZo+/rUvPblNQ0Y0Jnm6r23Z3ffMrqFcZcc6cylOTNTTM9K+kvvVRIld4WMevRdIEtWoqxxKLP+WgkcvKwlMUeGNFj3bZCfq/Tq1vvmbzyT+ma7aodcF1+sQk9aaPkG9bYyFUrYy+EhYxTVDUUKTEYOQcywu/JEcUU8hNb7lnGjNOH9mEs6xSi/WnzWmteLCiSsC6wATWd7Z5q0OHDhPTR9tnaGKTxUtRWGDVEiiFla18adjxJ12tIy4yNAOClnB82g9PSdo46ILV9EbaBSQYM/j7FF8uGYo5w1jRNxdyTNxZs4i8onFZnAPqanMQKwQW8/Q8SwkXL74MaMMHjL+U65zaUH4rs9Qw0oxelFHFk+dqSqFX3QLvAv7KxcpAOQUVQNWcO4ENF15zsNmLrHMWZxG1Ddy/qkCM1e2kGWP2n3t47PG+ZpHDrMNpyN61SHttLqB8IOLrJECNoaJZwAw1JbnAHFCPUqaTBppA99mp4zNxHammD6WOaSCDt4BFQ9/t5Ut5tPYzQvqFapB/byEw6Hohh6xAPdy2zoo8typbc66/I6vmZPINMeXzwulCxtSUz/BNTs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(7416014)(18002099003)(22082099003)(261021121427099003)(11063799006)(56012099006)(261028144727099003)(4143699003)(261022105027099003)(261026140227099003)(261026121527099003)(261021123027099003)(10067099003)(261102123227099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TJ+Pw5stecy62G3wIjBCcvlZAZ/Lk812IvO8//swkkVPSDJyDmUV5d+ts3/z?=
 =?us-ascii?Q?xNEIvMGR7mzo+mPR1psKgXg4dIM6/hW150+d6J/cUfOUB+XDIo96xGYzVUoV?=
 =?us-ascii?Q?+dCwoX/j9BSgvR7pPvWULfTwiwpYL+M6csTIh/JO7rca4adkq7JSyFlCBmkS?=
 =?us-ascii?Q?Hyy8TxJUzvQkWc7jg3NP2yPpvtGYq0AF703k4PL70d5FWNFO3BucwT0CFtxY?=
 =?us-ascii?Q?wf5ujUnF5VUQU3dZq3QAqVDaPoIuEIIg/OydvGAzBzcS/p9Bkn4awlwmh4Uf?=
 =?us-ascii?Q?uYf9s2KcChVs0yr7XJPl3qCaTNDUJ8/k1JWu2hSQTDv2Vq0VXnQnUymSNyUG?=
 =?us-ascii?Q?b5cwHV5a2uQtwYWoMbj70kl23Z9nCPNtFfybuiK3juKbtRKU/HYlxfVV/AlW?=
 =?us-ascii?Q?qcdz7Un3cqQ562fJMg5+jJq3XihgelhmxBicjHIah0232zG+Itv0V+RD0GOo?=
 =?us-ascii?Q?Fzu0momHXbqao46kQ1Xs9XN0dypWNgsWVpTbYmg0GLFzibOafljgX+HTWrpI?=
 =?us-ascii?Q?b4Fh+y6FKC9+qLULu75Jni2tKPho3ukcJ6+1ya9iASKgKC34kueGDqXBp84N?=
 =?us-ascii?Q?eOGdUlIrwm1w9Ou3fel8DWNVBJKkmkWyMJQEsp5TdhqclKr/6pg/fb58Au31?=
 =?us-ascii?Q?2EqbJVBPM2Au+f0I/CZv1NUvQD8BLD7+ncYNud1F3UxpBFfXmiLBFjuz4P7i?=
 =?us-ascii?Q?DWmwZmT2iasasBbxLoh7sLW5lXKsIKFneZnsVcmhOPEBdhmlaRUG3eQwWvLH?=
 =?us-ascii?Q?wXpYyq2tA1rM8/M32qREU8Jlu5A0hUDfa2ACgqepaIbP2gsbsNfGP68zUype?=
 =?us-ascii?Q?uWBQzHZwnKOt60LblDb+FlYYW5ZqDId6cAPjTEE6DVCy9+QFOq1gXOX2RkpL?=
 =?us-ascii?Q?tLRb7Mp3WC7jazSsS0j4Zw7QICTbh+xI+TU7reNoK4eGY/tLesBY2TOYV5g2?=
 =?us-ascii?Q?Vm1CQt72aj+uFKmT+6ruqRMbxGx1xjq7+6MN0LwijF1mM7hh2Eb/G474Kjrp?=
 =?us-ascii?Q?6lGyTM7vt3IG2hj0yQhMcaZOiQt8lT1Sh6DSu0WTdmwVX9uRjIJv78BO7R+4?=
 =?us-ascii?Q?scKhQ8Lg8kOeNX9bN7Vf36paje0fOy2qS+rESXagEZIEMKsv+8I7SwLwdJ23?=
 =?us-ascii?Q?LfaA9xwH9JqKs48+li46FN/n5Nff4RYHqa6FrbJQiGhGm480CSSOLDC5WtIx?=
 =?us-ascii?Q?pCIy2Ft0UGZ3TwWfy2g/+dSgaNRT1cnq4SfVkTZJP93lLsDW+z8m6Mcsew1E?=
 =?us-ascii?Q?+PatMA16ingTHsUO5UtDX15wCLfX40bZHAhxkudca1g6MQbOteVWgvQe+1CQ?=
 =?us-ascii?Q?4CnB1aVRVS8CcVhRlduKQibJrMPg0zwqvRl2M0adU3hw0FfT4Xm8feSWZCwT?=
 =?us-ascii?Q?LnUNuSIuB7cnqRO3FK+z8V7P1rgtXCWJWcPCA2NqIDtvZmZtMWRLYnZRDTcU?=
 =?us-ascii?Q?LiKQAjnUqTs8Eu1ecibW4591hop7CQonrT0mk8Ej2rEC8RNcn5wRMbU7/fQ4?=
 =?us-ascii?Q?ziCLpBJVpzU/7PMs1YrUOpAdOk7qbO6WPXRmEbD6hjV1nCb/52CNxxgANooM?=
 =?us-ascii?Q?97ntUJ4XgtfGICbNQ6GNlKRlmoWHc/4cRr+F3fTsR8BtEysHwV1R0MR/IrQe?=
 =?us-ascii?Q?F3JAXutkMKWM1BW5zkyPObXZI5/DTJUudypzSbFXrBozU50jjqzCcz6dDyU3?=
 =?us-ascii?Q?NE7cVJQGhTqBF6IhsuneI9KT+1vEK4Hu4gk19a85M3+zTWYUAhsvMGoL9fU/?=
 =?us-ascii?Q?69+z18onERpAY3vXE+YTKX08j/ttigXg0rgZvD03wjMd7oRChy8L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe1194b-bb85-42ba-bd4b-08df45af6610
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:06:14.6037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYdpqWd9GWusQzkmHzIN7mNiy/v8RxkIzBd52RQH1T54f69eQN26Ac5aVVXhLXUau4DgORty6HuEp267pRiZj4lOQfGR7sJyAWwszNdWsxf0vFKsxKZ+4qrTyysN6L74
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12442

On Sun, Nov 15, 2026 at 02:32:50AM -0700, James Hilliard wrote:
> The number of physical channels need not be a multiple of the number
> covered by an interrupt-status register. H3 has twelve channels and
> eight channels per bank. Rounding down the number of banks leaves its
> channels 8 through 11 without completion handling.
>
> Round up the number of banks to visit, and stop processing the last bank
> at num_pchans so unused status bits cannot index past the physical-channel
> array. Use the controller's configured bank size for both limits and
> the physical-channel index.
>
> Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---

If respin, follow b4's order, put your s-o-b as last one.

Frank


>  drivers/dma/sun6i-dma.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 885cb237b2b9..9533f3bdb949 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -589,12 +589,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
>  static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>  {
>  	struct sun6i_dma_dev *sdev = dev_id;
> +	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
>  	struct sun6i_vchan *vchan;
>  	struct sun6i_pchan *pchan;
>  	int i, j, ret = IRQ_NONE;
>  	u32 status;
>
> -	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
> +	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
>  		status = sun6i_read_irq_stat(sdev, i);
>  		if (!status)
>  			continue;
> @@ -604,8 +605,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>
>  		sun6i_write_irq_stat(sdev, i, status);
>
> -		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
> -			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
> +		for (j = 0; status && j < channels_per_reg &&
> +		     i * channels_per_reg + j < sdev->num_pchans; j++) {
> +			pchan = sdev->pchans + i * channels_per_reg + j;
>  			vchan = pchan->vchan;
>  			if (vchan && (status & vchan->irq_type)) {
>  				if (vchan->cyclic) {
>
> --
> 2.53.0
>
