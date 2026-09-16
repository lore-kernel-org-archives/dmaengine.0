Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F372D3CF054;
	Wed, 16 Sep 2026 19:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789585683; cv=fail; b=FPIewHU8iQCa7tNuoYReN0/+6WZQ1u0s3M4i4cgZs8q95qrb8VptXsDiTD/ndOmsgrsRvLrvtjm7hv1MfXAUKrL9gvWPm7K7IvB0sOpvnlncVfs4dO2dDMKLFM+8qMU0IsBtMaDRPnnbG+VLMSWn9MyQONwWznPAnjWDKoXoGCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789585683; c=relaxed/simple;
	bh=zQ6uAy39u+UwmSUlJ2bVN0CdLdc52I0JR1JLZRH59/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UXD4L9fzIS/JFTFrZOVRupOq8+M+uXJLJrn8EtQPcqKUzMNgxcACNmq+nYQx+YNqOcMxRovVTFo419ZjXL4Y29hEgWtSHUu8xgEKbMCq+8hgin/UuQ+/fCrGCY/oH2iAAPfJsx7Mmyg/r/oVmVnplOkEcSlERuId590EnsY4zDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DZljf+Gd; arc=fail smtp.client-ip=52.101.83.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DZljf+Gd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZvlTV02fzaOvbA2wTFXe7Gp2kVX5RpikXVhVnyF9OG+gthyloPqZ+YCu0hPSeYgelC6SgO+ZtG183y6bu2FvnouUCUrbt6RlYJYO7UcDhBWqV6mTaC5uU+Ai6DcTXxyuFaeDibmeChsDyUunK4cONBVe9uJtlpaH2zrf1ExtBITCxBYc68trXWXEv6ZSWG5BxQblZXGLytVY+xlKXtRt0d+WAHozZSAnkoLIOfU+XrZw1FWJOL62qzjdFPBXeSzV4RmD1zChW91TGhvJ/vt1g6/85+XxyvWa0EEWn40ECvTK6ltgRGac+gXz3/GlFmiLxxPcxOR8WNgFBFL4IGAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRPoFTCTO0S2KF37hWU36PwmhMYK/4E85DP6/5/oNxc=;
 b=bHJGrcGtErLRwU8+b0JvQQFyXs2UdtpmpQKTadPuBx1CZoWLuApzv+S80n+wVIILwLFij2U4g2LTRVk2wo3VaQ440Hx4K4EJ2Zb0ALUDWL1ySPLZLH8zPs/CGo4AQEJgelifprxOMIreYDVAywVhTdi563AbRdLvu7T78PN3+0mtNpmwXUIbFGO53GM4j5K8GmQJSX7B9SdhQ3e+NtvuWHNCcz1V5esU6IEbKK6fUeCSY5kjzsH9/ugtfopvCT66DDflMuD47XFzmTgLnxAgODZRerIsJgGlWbcFOVAV7Z/Mjmo9J25qKucW75RWBOSFQFwrhLUKR+TqCA/RWxTc3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRPoFTCTO0S2KF37hWU36PwmhMYK/4E85DP6/5/oNxc=;
 b=DZljf+Gd0j5i+mYGF/UzdqNL4n2k1g4o6I2mRCcYpmN64xnYSxdYEI/DJu8Pd+BPYkQQA5ZlDe5grv0jBwA6ieFkZeHOqZHraSUQ4vIA7rxqqkORgPu8s1U0TL+f0F60hNV4Krq8eFS8qeFTrjBLPtPEi/5IrA+LujAXfyEAzZXBEcNsyOVdoSjGkgj1GmKb0BDRNsP11UdmFeYCK2q3EiFY7fftRv9L4HkitLTSpUNGU17hyhfBDPk/ORPhaHVTM0RDB5Y3xd3oyJGiIHPAuVREjXrfTy9cJpX4detOGB8hNV6JUeDU7qk5HyacaG2bMXRKfUXij95FE3JVHrJxkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7621.eurprd04.prod.outlook.com (2603:10a6:20b:299::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Wed, 16 Sep
 2026 19:07:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 19:07:55 +0000
Date: Wed, 16 Sep 2026 14:07:46 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Stefan Roese <sr@denx.de>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: mv_xor: protect MBUS window access with a
 spinlock
Message-ID: <aqrpAlpvHWTi9eGI@SMW015318>
References: <20260916182608.13523-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916182608.13523-1-rosenp@gmail.com>
X-ClientProxiedBy: CYXPR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:930:d1::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fdad854-d1bf-4f57-897f-08df1425d044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|376014|22082099003|56012099006|5023799004|11063799006|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	A8aOd2yyBQYgRFTpWMu9Fy+jOsNWEwNQVYbrxO4r18iNlwBONf7tsrJ+QlDchhlZwrh16iWU/LXIeMFiWIHFxfMibSewaqZutE5XreOPOt348X5nXbpGEWPhOIIi7x8szPrVJLg3RECB85gIHGD+ft1OpbQk3iKOLA0PIANHSei1nigi+a3Qa70V8uRhaDMRNiDjBslM+AnXSuVUAPkMESNNDbw3/6PerDgaptM170SuXVDPDC84tzXMfTCCZE9QRo9UheJTLfNLvHJT0/R1t3kN1WCau6h2eJ9Nuu1F1PQHIRmc1T9G+rc2h4Q0BPJ81R9+N41DZLL64IoA5g00vRwGmN4RZPczqnYdRRhXQ4FXiOqPlc73i4plsso86oWrzGIwv5qC/LvUCrrE7AJX7qI+TqRUhAMi0lA/VT8sNMtt/kcwu5tYnZ9tNAdtY3q7mOGaaMUUz4wzTh2ZsTg4T5PWc3Ufatp+JHj+Xcr+VPNNHpXReY69PUhk7Tlc/7/3riSesLyGxfks4sWrWT03YF+IbtlRKFQSH6VpwzTXEHS1Umemk795lV9CcT82U61pXndMNP3EiThZPk36Y1lm1Ci0UTyZnw1FIIo7eevbHVnHXvVNLL5uyajl/uzFnhFSyXEfIyzT2zZsMSFD0zZLlNkZzCDbUTJTQo2mJV145VU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(376014)(22082099003)(56012099006)(5023799004)(11063799006)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U5VBtFybpFGj4OAcEARHAeZSyNBuo8ntJmMM6/22Sziaaq7MgRcWJW8Qxi35?=
 =?us-ascii?Q?qqPLFCCMMViPxdoYggKD1MCE3dZ1scVF9WbGRAS1c8BabX3mUVa8U2rrdnLV?=
 =?us-ascii?Q?0MWyNeUpTj+ofWveC6hIw5rgIDTu9a1+3RykICLbqH7lX/Z2uJ7pf9WFrd5s?=
 =?us-ascii?Q?FQVrJeqdq6522MbFjGVQDfAOvjOfuma7+94Km9nLLpa7OveWLoZQnEMWoINX?=
 =?us-ascii?Q?vheAuMVwFjsbmfzlLaHFof4v6IoS/2jnaxLaoxE2OLixVnOEFEClB3qxJj7Y?=
 =?us-ascii?Q?GBY9LtYuppAM0WgQTj23rW9t1u9IzjXhgQZ4BvgmILSLAOCVIeEgVLn5lpWI?=
 =?us-ascii?Q?c+yIO40BkonGZ91e1kywRWABK6P6sArn6ham3a95hxzeQm5m3q6O6QKdkQC/?=
 =?us-ascii?Q?CWn/F6lN1/hiOWsqI3KNj4Q4n927zAeh+ArrYLklap788DvbC2+xGgPWcM81?=
 =?us-ascii?Q?aFNj5YZBVv6/Szx/bzLj/jspc7FCcf1/lK/lX5A68GViOD9W5YRuiRPMw47S?=
 =?us-ascii?Q?X1TWZNQSKlcWQsMXAVxygWSWi0w/UGCWy028H+iABW7eXQgBQC0s+EqdmIRL?=
 =?us-ascii?Q?fMVU43Rtkaj0KlzXGAAi0TGvVJ1pEj7UWTXm1XcMD1Ga9AqGZq5cYYVWhxGg?=
 =?us-ascii?Q?Dx0ZMHmeXB9AztThRCDJbVWEabxQri7ECy4J7G5YSsYc4C6EkDe9KHWnm/0I?=
 =?us-ascii?Q?n/JpWDGu0TY766qA/nTaCv4nXacP+Lr63gAtcN6bIIZiQQdt6ic7FihN+Qpe?=
 =?us-ascii?Q?QwOBS7h9uw/4UGU8wy87Yiw6yS21a6ujTVAg0wjaoXpjgrlExzyYNhSWDtqi?=
 =?us-ascii?Q?3y1q2hV0YOCFZh0+ZLtSXjqYcwTpMGMysbs/DAURhcyY+1qx4IZ5TcbHqL4H?=
 =?us-ascii?Q?Z5j/bAcV7vXILxxxUErsndEGLD5y1krPJMjB3WJibJvilVwhjalzFTtI0tOE?=
 =?us-ascii?Q?3ZY78d/8FPpGPNOaDBOH3V1mDvHB3uMPfTNMHeGLz1vXHIk+DpJ2PIFwoxWe?=
 =?us-ascii?Q?Mmx+5oRr+qtLUkLRea255QzvQQMAHRzTuMI2Byoh+ZSVABdZdkMTO0or4xX+?=
 =?us-ascii?Q?acP3SqCDaES3N0nubeYD0pE9NPzBe7HWGzb3+FB4pW488WJyAtU4WTVCtACt?=
 =?us-ascii?Q?bfE1igwXtZcyYqSgMNAoYPLm5tg09S0KvKUIowaE5K+suM/mshiXXXDsWKMM?=
 =?us-ascii?Q?4IGPdOFEp7cSybR5BwDhC52dESSUh9zDK+rpNMoD5no8j+Qes+HumzMK644L?=
 =?us-ascii?Q?RcHeQ8zMex5yxyY18HLUECqgC9q+eaDPmrS0rJF+LAjM9bznMlV/tkLyK00L?=
 =?us-ascii?Q?Scz2UPFq6Fl9xLarUzahIe9Csc07r5ElAuTG5R3VhRD63ZGgDzXgxD7hJMB4?=
 =?us-ascii?Q?tgcbVv0Heimm8UtJKYKjR4n+0/HXdgx31nu9wHzvOhalum6KsdHQWw0RzenT?=
 =?us-ascii?Q?yWPuJONG00NVO90zOnskp53H7vQbm6HtcCys9+QoHQzERiT1czgmOOuStY0T?=
 =?us-ascii?Q?tbEwa9z6tMRRzaXQcetviXLm7lmAUDFqBArG108kMVwrBQrWNYAdeKCNy2eN?=
 =?us-ascii?Q?//jzvwlaKQXr4HPi/d1wnCQjDrwuYtqw31GzRQd5jb8eyGjU0x6RmJG9e5Iu?=
 =?us-ascii?Q?M18nbL0AuSGoJP6bVqScRRK2OXigXU67uRf1hd+IeOb/BiJW7rDeN/cB9cav?=
 =?us-ascii?Q?pP6ale/mZzoZALQ0+iEDx6W/MYuMCab6reGzrRr7V+S7wwQ5g6ljSruESQ6F?=
 =?us-ascii?Q?Q4MMvceRmv2QfLX555EHl0NfwCa4rW37JDSOB/y7u/Fj2sPSXe0w?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fdad854-d1bf-4f57-897f-08df1425d044
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 19:07:55.3089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRuQsxV6uJyn9uShYJsAog694nSLiU2zq8JBJUIufB3bFX3p/XH26MKFStBaNQvKfX/+LDclvd1yNdcVyjoAzBMbNXYLO58PTsTKu+ZDPaPiYQPsbIJAxeo3ZJM2SAEz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7621

On Wed, Sep 16, 2026 at 11:26:08AM -0700, Rosen Penev wrote:
> mv_xor_add_io_win() reads and writes shared MBUS window registers
> and updates the shared win_start/win_end arrays in mv_xor_device.
> Multiple DMA channels can call this function concurrently via
> mv_xor_prep_dma_xor(), leading to races where two threads can
> select the same free window slot, corrupt the registers, or produce
> inconsistent cached state.
>
> Add a spinlock to struct mv_xor_device and hold it across the
> register read-modify-write and cache update in mv_xor_add_io_win().
>
> Fixes: 77ff7a706f01 ("mv_xor: Add support for IO (PCIe) src/dst areas")
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/mv_xor.c | 15 +++++++++++++--
>  drivers/dma/mv_xor.h |  1 +
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index 0de2b1ad5c30..e7c6ec54ce25 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
> @@ -497,11 +497,14 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
>  	u8 target, attr;
>  	int ret;
>  	int i;
> +	unsigned long flags;
>
>  	/* Nothing needs to get done for the Armada 3700 */
>  	if (xordev->xor_type == XOR_ARMADA_37XX)
>  		return 0;
>
> +	spin_lock_irqsave(&xordev->win_lock, flags);
> +

use auto clean up guard()

Frank
>  	/*
>  	 * Loop over the cached windows to check, if the requested area
>  	 * is already mapped. If this the case, nothing needs to be done
> @@ -511,6 +514,7 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
>  		if (addr >= xordev->win_start[i] &&
>  		    addr <= xordev->win_end[i]) {
>  			/* Window is already mapped */
> +			spin_unlock_irqrestore(&xordev->win_lock, flags);
>  			return 0;
>  		}
>  	}
> @@ -521,8 +525,10 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
>
>  	/* If no IO window is found that addr has to be located in SDRAM */
>  	ret = mvebu_mbus_get_io_win_info(addr, &size, &target, &attr);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		spin_unlock_irqrestore(&xordev->win_lock, flags);
>  		return 0;
> +	}
>
>  	/*
>  	 * Mask the base addr 'addr' according to 'size' read back from the
> @@ -540,8 +546,10 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
>
>  	/* Set 'i' to the first free window to write the new values to */
>  	i = ffs(~win_enable) - 1;
> -	if (i >= WINDOW_COUNT)
> +	if (i >= WINDOW_COUNT) {
> +		spin_unlock_irqrestore(&xordev->win_lock, flags);
>  		return -ENOMEM;
> +	}
>
>  	writel((addr & 0xffff0000) | (attr << 8) | target,
>  	       base + WINDOW_BASE(i));
> @@ -556,6 +564,8 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv_chan, u32 addr)
>  	writel(win_enable, base + WINDOW_BAR_ENABLE(0));
>  	writel(win_enable, base + WINDOW_BAR_ENABLE(1));
>
> +	spin_unlock_irqrestore(&xordev->win_lock, flags);
> +
>  	return 0;
>  }
>
> @@ -1353,6 +1363,7 @@ static int mv_xor_probe(struct platform_device *pdev)
>
>  	platform_set_drvdata(pdev, xordev);
>
> +	spin_lock_init(&xordev->win_lock);
>
>  	/*
>  	 * We need to know which type of XOR device we use before
> diff --git a/drivers/dma/mv_xor.h b/drivers/dma/mv_xor.h
> index c87cefd38a07..034db4d0bfb1 100644
> --- a/drivers/dma/mv_xor.h
> +++ b/drivers/dma/mv_xor.h
> @@ -80,6 +80,7 @@ struct mv_xor_device {
>  	struct clk	     *clk;
>  	struct mv_xor_chan   *channels[MV_XOR_MAX_CHANNELS];
>  	int		     xor_type;
> +	spinlock_t	     win_lock;
>
>  	u32                  win_start[WINDOW_COUNT];
>  	u32                  win_end[WINDOW_COUNT];
> --
> 2.55.0
>
