Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792787585;
	b=Van4SfO4AFZtdXrd9G0Wlw2BdJxHZkrVxk83Hch59fFC3gktqzZdacaDO8+KajV+aO+/
	 qi8qs7QJDdtvRSafSY+xozihhll8JUx9NgKGebfdUMA5dlKHFa77xBEdh7VLxav0KF99m
	 OlcIXppZHX3PVEP69G3Yk4XxZG7J3ngdwFgfeKSAJKmpp59GcvT3Dlm0A/e9UQOUrawqS
	 R1ysU8TNYTogaYO7m6OuWytcz2oSx3Mtq28gewXNgqWvWYQDKXPu+gcIfEp59JLCpKfcg
	 PDfnJiyeioop3Z5v6Fs/OL++pF8NJttkPduh33x+2sQsN06wKXlO1yoc6NY3ij//vbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787585;
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
	bh=OYv/zjTPslf0rcsVc+BdF44GfTteNk0YJEHO0aQQVcc=;
	b=JcdgVvDf9MYVDd8yAySwiAIaKB+mmgbuMy1jYrjUqfi3EVyQAUmyEHi7tbGVcGh+F+np
	 Uf4w2OEa8+Wr3C2Yg/qO7jUUgSEzj7Q1y/Lexq/wd0C3uQB+MtydYb7yatRFAOfq+Z122
	 e9NlfiPer5iT0NQeC7K9YlIeb9wh3v83fAnP9YZBpwDcGd9l8NlXNBwmU3RGE6yuo/hQr
	 Sl8oJoNf1tLOJne6cx3Wfnmj5uCcPZ6toHn+Xt7noVwY1FwNUXTZK8FejvAtADqRd2zgk
	 QguW7sH9pkSdKteYC0MyzpezwWs8i5x1t6qzh7cRqJni5FzuxpqpxxZIzWgDUVmwPXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lxIXM7fH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.28
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EAC606A31B;
	Fri, 23 Oct 2026 20:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7EAC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lxIXM7fH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qm/L5u/anaMZ25/AtoYF535zARN2KTyr1QJ19PcZP/EL9xxQaWDRAlKYKfuZJC6KH/WWCHDlHdRlf++NAYNGeKA2IadbS/0lsggYO2ym0GVeNMHkfBRyWbQ6Tn9BxxwTJhAb/gWddX/WnrISpgprEb4anzcrHLd2M+NkCT3KzgJqpVnoaDaqiyc9C7iDvcI+SPNFJiCkhGTfMnsS7bNL+wsqUa3y//rcP4WQU5eJRBoIGFqSf4H8492Ata9UdoZXhJRfaTMvBZOfsPzsMehsykBZMlzUdQXDtTaoWdd1gs9fhWZ9vi0RPfWTenrxzALJjmEEthbPqbXxo/mIq/fs5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYv/zjTPslf0rcsVc+BdF44GfTteNk0YJEHO0aQQVcc=;
 b=sG/K9xZtr9Lgx+v2GKhx2R164AzRbIW0/pjEGdmpC5/Qom6m6e1HVYa+mpkAo5Dw8caK1H0R1KI3kgAVYxYfK7uaxmIzhbJcxp8EUdXgcjsOXWEOgR2e/gqcNWf/qGP8hUSN+0pt8aFmfGSHeomXJoOYpyKwj+UOqD5q9SvKg8iCnnkjDTRCNKilyxa63u0K+RPMWmdcf9isdx8mQABFgxMKUE1EAAct3nca+LqPJ0Kmy9ayrI0hASDpkA4CXoXBpoPnrvY+wb/W3WB6UDgayqUdz1oi6WgsQrdE6aq3n+70n7Z9pGhmLKJZg0K7u2QZJN8J35aprL5sWPTIxJiWBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYv/zjTPslf0rcsVc+BdF44GfTteNk0YJEHO0aQQVcc=;
 b=lxIXM7fHF8o0F5KJ8BwTf1PDYaqhCXFQ6aHzWLSIiAOqTDvhvGvIXRmf3yXSmXUchJshaZu9vr/OxLzVMG0rmYWhmVYkU/axNUDcGTUpriBWBX+6H9r+7jzzsSKQN53qUjN4ZZ7DtlomrzHj8eIysZyyXo9EBRNapUl9HlvVngGukpmPkR45yi1Ozf1oE5GiNuYWMzxUQ3mTpo/RX+z4NwjNm2M7rNenkmZY5606fD4IgGxIzk42KpZzt6bp2cIM6hhPmTIj7lfqWktmPn/KuVerrWuD0sjJwy3jNZLnuZmn0bd/Uhw/greCyUBXSRObSMIv3WXoU5nZ+8ve8SbQYA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB7816.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 20:33:01 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 20:33:01 +0000
Date: Fri, 23 Oct 2026 15:32:51 -0500
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
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 3/6] dmaengine: sun6i: serialize channel reassignment
 with interrupt handling
Message-ID: <atvEczwQ8Xh9vcAI@SMW015318>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v2-3-c9e07cc44bf8@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-3-c9e07cc44bf8@gmail.com>
X-ClientProxiedBy: DS7P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:1ca::16) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b59df03-28fa-4bf9-efce-08df3144d50f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|23010399003|1800799024|261022105027099003|261022075727099003|56012099006|10067099003|22082099003|18002099003|4143699003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	ZfAmYOeDLgmZuHkWj81hQrlhq/6g7HJcQSEA6ePNVbW6Y/XOiOFkBzZvNlyo0Ucn8UXpmHej/e1Xncf1niK+uXRiJrkrlbyWUnNueFRHbmvwuhXdWjjk6wDSlnUE7z728wkZ0PSk1oprKu5c3XBo1Wq8NzUmx2kKMq6ZkvqCPlrfXhCn/SI/IsmRXgu55I4VXEcL0cnAgCpeAh4XuOohyfDjub0ykfPqoLp6MCxiJg/YPPB9cbQZ+5pxf4e7s9lmUsl6ZP4L5Upb2Mcm0RIj7Lhkqu1DqMypHor8r2LlPhDrtET5LjRU5k/JapCkTkPvoqS09MrS2YSa3ZDygG+8k30h+ZimSS4dXS9KLicGf7A6rfvszzRaqTPPOFMJUVeAcaOREJjESKSRIPG+2GUEBvcaDhNKTOXHVLEqR+bWI/odwN8FP0+cRMF4aECr941IELWeQdQ9Po6Dpx5SC9kg+Z1P9D0WKuKc9rlwcbGe2Y1CVxs2bK2xQjmivqYBW/VKJTiXpWRT6iJ1DgCC00SZbXsAvprPCMcpzISoOdzVyRyT+JxDBfQ+8MpZ5Cxlaimo1C/0L0fD+0h4npTRW5KB9AGsbUzneH5RlSfoPn9EXKKQ2vEZoPuIYOPKLdysX4CBYbnALoqz+tu98fQlkGqQ7emsZBYMU8uqKc6pk7jyQB0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(23010399003)(1800799024)(261022105027099003)(261022075727099003)(56012099006)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pnosb6uW3Vml6YM9akNSpE1oVzlACR5cMMAJOH56LGaVuvlFhauHDX79miA5?=
 =?us-ascii?Q?n3SAYRgy3XA3nFxBgknUeqFJ1newIjd6p2sVUJPjpCSWRjYqGKsnENtUWjzw?=
 =?us-ascii?Q?4Jhi3kqH03K/+UXIM1J89/CS3q4kjCtpHvcPUvly9N4Ky/4Hdxo0UrNjI15s?=
 =?us-ascii?Q?pwMvoeGKAHnQK7B9J7eznchN1+7mklHC65VJh9yxgrz//ixqL84/i7G+PSJt?=
 =?us-ascii?Q?KC/3b5i+84j0MPTgZUmKM7b+QA2Vil3VzNE1hIpDb9TS4mnTiO20B26q6DO8?=
 =?us-ascii?Q?KCDKRvy5i+fr0EMRLpougIsxMLIT0zQ87EjtiomA2jl/XS2aMfJmsnGldL/+?=
 =?us-ascii?Q?kbWyYzD+H2CpjmuZhB3yaXuj70o+qZlo+fxAuNWNO+5eJ+0v/YNDE7qXHdw0?=
 =?us-ascii?Q?JIdjWBbPSudszaseQoNYET+rTelxOfh/PkUyveq5FPTmRQFLJw31+wFKuclx?=
 =?us-ascii?Q?HrnqT5GIQ6ST1QcO2iqriKsHfo8+5qZUE7ElmodwOP/fCaaUwnHJ3lX+K2C0?=
 =?us-ascii?Q?4JD+hEPgei4YvwXC7NtQiUSipq4rPqW4fAjN3Ehsaa6g2P8pUchHK/RjAPZi?=
 =?us-ascii?Q?Fof+GaQjxLQpqZx64tavgrEHvLzooIVFhf21BK4J0muGfizlhzHGs+Gnwozl?=
 =?us-ascii?Q?9+2EeJcQ8ELWhkSHAMdeJvKy7kiC5LmIORIxnxmheMn2/iOGEsrRe7NYaJaB?=
 =?us-ascii?Q?IkyavJDBiP+b6heux0lncXuBHgQjZkTDZQ7JPTbFt5/qvS4G+9Dvqm7WC9LL?=
 =?us-ascii?Q?nADzP6SwXjMzu9ZS7t/1fAWbEZXfV6cNZ90yIoPaeciD5m2B+vt6/uuNhh4p?=
 =?us-ascii?Q?lqFE7N282QgWS7M8OeX75A+TqSOLs5blLt7fwZ0R/V20VfeyP7XN0ojJ6zVJ?=
 =?us-ascii?Q?vAASAt3Bag5gf4eIp+PfbKCX2IChzH/ynd2JDWJIL/lU4QK50zUrdK0aDmcL?=
 =?us-ascii?Q?R+c0aYhpuq5Do6D6OR618xo7gxjretd9BmbBMxRv3akTIOqNVjVAG8nibmuF?=
 =?us-ascii?Q?1bcVCToRRxVQ6J96pA6uCtL1KJjmLsj8N7TV/HsfwQiC0rbiKQHipKw1PbdZ?=
 =?us-ascii?Q?+AOWhn465MwvKiLNt3kMhgNSE+WAOquhd51jegrK3YJua4afNiJLi4fc6etL?=
 =?us-ascii?Q?leCEHX5Zlpft+atVa28PeYPUyFna+it2Uy6gz3Dj0Suj5CvoDlPb4Ysf9O3j?=
 =?us-ascii?Q?FOzdkuKbPEWCPxMLpg4Wamgg6wWGIv+kf5SQ004mHtL6Z6SXuJTWvdCu44ZU?=
 =?us-ascii?Q?AAO0yCEkUY3HO6rIt5HZ3zL9A9xs7GVn4OxgvXy/n/VVnSuaI5h2SabLeTrL?=
 =?us-ascii?Q?teleQlISAtz8dDvgwet+La9vhF3GVBN/bjrj5QZ7BhZsihca1tQ5eHc5/6VW?=
 =?us-ascii?Q?4Q01TcBR7Ok9HFFvKy7YPuc3IyLK0w8hVk7l+z/wzNYka+rkyQIMJygDNdD2?=
 =?us-ascii?Q?hk+AUj+BFY2bTcuesdOVuMUVU7SsaHEs4esPtqbtESnXZATRpPdjYDe+OZS8?=
 =?us-ascii?Q?TetykXjkvBhi/Hit5RZups+geeTPnJqQ7bc0ViIvoPnO5i/oovMOmGWy+pfo?=
 =?us-ascii?Q?ls4Dqc2Kf6uMMIel/eSA3evQLHmJiaBGtFJqvJ0hRXNCb41zDrlUcGgaKK7T?=
 =?us-ascii?Q?oOgyFjv61f7koV4OYDFL6CknfU/HZeZHnMDh2TkEkUB2TfzVIrPH2evQJ0W/?=
 =?us-ascii?Q?61e7Rdn6GwgqJ1AxlPZpF2OkLKup4QNKy+B7m7bQHIEnehFd+gkyJuZcZfdj?=
 =?us-ascii?Q?BblDnMuVkQjQ0eQMwGlmkTU+mTmzmMKsr7IPrf5phbP8ZtYVNsKg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b59df03-28fa-4bf9-efce-08df3144d50f
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 20:33:01.4138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrGfwQ+lLOjlmFs1WmAovFaWv4K+9+Sm4Vv+GNaV/I0ka/FC9emMCHIBmf4GAT6jCxH0QWjvivMH7qldEN+UMv13RCqjZd5YsT7e5OL8ftzgQRHH9kOC8mp+qEqzxXh9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7816

On Fri, Oct 23, 2026 at 12:42:37PM -0600, James Hilliard wrote:
> The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
> termination reads the physical channel before taking either lock. The IRQ
> handler also takes an owner snapshot without protecting it. Termination
> can therefore miss a new assignment or detach an owner while an interrupt
> is about to complete its descriptor. An IRQ status snapshot can survive
> reassignment and be applied to the next transfer.
>
> Use sdev->lock for physical-channel ownership, pending channels and the
> shared interrupt registers, nesting vc.lock inside it for descriptor
> lists and cookie updates. Allocate and start each pending channel in one
> critical section. Read and acknowledge IRQ status under the same outer
> lock, and protect cyclic notifications as well as ordinary completions.
>
> Clear the active descriptor pointer before publishing finite completion
> to virt-dma, whose tasklet may free it independently of the allocator.
> An assigned channel without an active descriptor is ready for the
> allocator to start its next transfer or release it. This replaces the
> completed-descriptor pointer and keeps residue queries and termination
> from consulting a descriptor already handed to virt-dma.
>
> Mask and clear a stopped channel's IRQs before releasing its ownership,
> and clear pending status before starting a new descriptor. Schedule the
> allocator after termination so other pending channels can use the released
> physical channel without depending on another device interrupt.
>
> This also keeps process-context acquisitions IRQ-safe. Client callbacks
> remain outside these locks in the virtual-channel completion tasklet.
>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Is it possible split to more small change? And you almost add sdev->lock,
any place only use vc.lock without sdev->lock?

Frank
