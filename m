Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9210477294;
	Mon, 14 Sep 2026 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399384; cv=fail; b=fGYbLrHtEo5axQvYLjU+bZMyaJoQmu1eJoMsC/Ufq47QZKIvzMWNqXvHv1JKgrqY61RIbfjpwrbvGgz4MEc1zHIpZ/FyB7fiz8JvQlhDCsJXw4YK+LZanFb2uG/FodKij94pmxv5kaSrovB+2QNuyXswfMwshIUxDMmwraM58KE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399384; c=relaxed/simple;
	bh=umwoItAYkZVr2JaOEjDi7AsOAxERRmKoZr2rKqYS/hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G018Q5LZyrvE6nxXh1Ch1f1Bqq0dn6G6LzD1lZV9H8vgmdlLFKTbloq9zLC+xvM5vWpb2Q02q6cXvI36EwHtnV6Un7slkMI26mEEO9TwoJV7VNIWGtaJezbqaeIzTBWvEtFSh4lhNE6l5NLyhV6/hcU2P5PUSiSsmFWBv+R9fSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NA6F4Vya; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NA6F4Vya"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvstL4inkdNEKKB5hCFB2vmb0Iz/zrJBy3aJK1bVCPoq7sAKsqOx0v3j6ib6RZum+Ma5UsPqyE4bqE6C2xeDTVC/biLTo2DHsJgD0KvNCwE8sZuTB/v++F5k9fkU4xGEeG2mfyA2tc7Fqj3wbdQZbaWfNpFT2fd1luXvIZhC0r5eLRyUYcwzW9vFM0kZynGPfiBH6tQNZTzbOPSqvxKj6MqRAuUONtZ6S5Yswr1GFtJlhp5vkfIXPyFFV8hTjkU+/3tUMxcBl7d5At5W99fmeklTWD1XGdGrQ8kvDazPUvGdaAMOoxjc/l+6z0UP5t3eXYuWZf8DgT15/n5CvFDjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5eS+xK9+YODs+D6P9HmjXSz3LXh4E+fZU+5jnLw4Hc=;
 b=APlDdrfFMVydqd2SPcewPhM+5rrJ43/+8NKKqiKaQtX/COUelv3f4oPpeZj4EvdIORjn4PSEknTaXJZP9PzJDNfoYrBjxaneFmWol4mBTkxlWsdPrQwIo3LMkbot916/k+2E+wc7mgp0/u2tRun11xtsleED2pUdRKoc3VUERg3GY+q7ikPTdA7zNzIUJWeXti00RAn45ulLS2/Vapfdy1yilinp09w3J8IF1ZD/IHbIDpqLZei0DMAOx5K1p4rFnJrH4wxwQ/XS6nhNGYv9fwTQuCVFXwQ6Eu5efD5JfA8+4zA+FGRIJqcaXLUOsON5dmQdfaQ3nzrYd/fOodxpZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5eS+xK9+YODs+D6P9HmjXSz3LXh4E+fZU+5jnLw4Hc=;
 b=NA6F4VyauloB3Xe6Wxn0uK6f5IMZG8F+O9qJFAA4moJAv3SQ8dUhaZSADkupkD43HvwRH5h8Iwpjpq5lq8Go6PsmUZeALZj7RySUKUp5dNj7kopXtbESO3Wb25ZvQdP/PVBI09xfxZr8w2HdzTB/eRVo8mgL9mlkGU5sX4OC65rzBnlw8k6TRuXa/rTWM5ju8gYzqptuHIbGSKnIWiihHOrKpklKs8Cgg0ORPDZAJPORiwQsdzYt4mxmhXkW/UWbbBJL1OH4EcUAebhUgCX7glcgmL0mH3Co0ofXPWGt+fJzmHNBBboeei/Laxna7k/DmKDanxUvgqCZXBFQDDisbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB11691.eurprd04.prod.outlook.com (2603:10a6:150:2e5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 15:22:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 15:22:58 +0000
Date: Mon, 14 Sep 2026 10:22:49 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Devendra K Verma <devverma@amd.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dmaengine: dw-edma: Configure remote interrupt
 routing
Message-ID: <aqgRSbIFDuMOKkzF@SMW015318>
References: <20260912174023.1227397-1-den@valinux.co.jp>
 <20260912174023.1227397-3-den@valinux.co.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912174023.1227397-3-den@valinux.co.jp>
X-ClientProxiedBy: PH8PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB11691:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f19dd1-3af2-45ac-a3e7-08df12740ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|1800799024|6133799003|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	HRXhB5irwDT3qqBw/yFeqwuiEhodB81aD9sJ5I5HOheYhxoYWZdLc8i5l/VI8L617nHupR1Oe/eL3dwYCRQ1Bbkv3rY6qqexkscgmbR53ZX0m5ElEP0675Shl8yX3fMX9b9i8sWIYy+XSIwgeSpID5pGXl3Sgr+4D0tVm/tKtiZzBONU5CgdAhg8BvbZ3X37scGdRJalgXm7FNpzrD1Gb+Lk17ojdoGevEfKDA5GsvPq4XTJDWCHH3omx5BNhn3nLD9jzRkPs8PwNzs2mGBhrpMXihfV/PYWi8suGLvPY/73b94I5v0mLNDnRY6l7Y1yW7TE5GTG0v73TI4zO+TD0jJHPrHzVhNF9GLYQMAQ0x/nIP7uqg1RaMt+P5kSwYsY6sOHTHkYJfhZe6w2bIZCcMoepL0vGYEVSnZiNczZIDMdMHlrMPLeC9IEbMwP9wO+ga+DGuPSI9WUcNM38nPoxgLY6Sm0zMl63dMHITwyYTuyxZ/gFTPJbRr4dLMTLE4fJDWPaMG6eTr5xAm5LF2jnEyeNT2l5WlOJWamPNkDB/ZMkqT8RPVw0JVCw0F7d5bi4Lza+0+1bOQPP44QqLHPOaqmvY86t9iEO4rNz2WSA8NFTFqWpLHUYvwuLWPt1YjvAg7gDiutth24SdglccZejsjcR5hfAQfug9LqfJpx0JM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(1800799024)(6133799003)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6UoKBKlaKQdiKhcOBwKfaT+av8Q1XZWivkVr0FxibsWDqmtVONIoPJwbvAWp?=
 =?us-ascii?Q?u6agfeL2VxZb7+rCIl6+l8HNf7NDA9zxvDSobftLRd5MS+BREtzhDs0wDtq9?=
 =?us-ascii?Q?g15D11SaUTy+YiwPHPAhaVkau5mDw0i6hF8TV1vakSyqDpD0/HapVjlYzc1P?=
 =?us-ascii?Q?ahdDrzz/5JA6q8VEH6zcjpwa5iZho4SMKYBog8tIHxXxgLdyeTuNWvFGR+2d?=
 =?us-ascii?Q?axYqXNfUTjoge+cAcSpuwtTWXCWg9AmtyttrKW2Se3bre+gw3g5oa3//W6TQ?=
 =?us-ascii?Q?dUi2yCMeEaBh5ml8FkjwSVVmfiDq1UeQ3sxKtiJ6HSeH8B1mwoq0VWejoHKz?=
 =?us-ascii?Q?LopsdCNwtFAjxcTALkRLWUcLRxw6xgM6t3vuFZZD9xOZ5b/i4ixo1go/Sycg?=
 =?us-ascii?Q?N0fHQYkuWL1NaY/9rNrLjXNcxL5cZnCHwQinIWVpEUoSr8Ec61O7iE+RWWKj?=
 =?us-ascii?Q?QJ8gtFe1SRND10jCFG8B4WrFZl3iJ7ubN3W4eWM54/Cl7BafnRtaK4ViP02X?=
 =?us-ascii?Q?9lwm8FvYhd5gvDDBV3Rz9GwZwQLgpIMAPktZvdoR9BRMLHhEXMk+fNMNOyR+?=
 =?us-ascii?Q?9MeAuQAOMRvlZjUn2xz2pByb5mdCMA92ZxWuvAQ3ILNrXD1mw66JYLwrAjaR?=
 =?us-ascii?Q?6BFdPoDX0reIqir9kYkpSPAfvoR/XTUy82VwuGJXRx33meUf34Ifv3mavl66?=
 =?us-ascii?Q?41ApFaiei1omIs6/o5YPZZa9qHR4XYYSUlhe9nvsXGVAsDT0Uw7PtmO+pf7U?=
 =?us-ascii?Q?9Gq6EbdZeNsLt86D81C+zNw0JHhKm9Eztf8Coq6/oPEIvCegg82kRvlG95pY?=
 =?us-ascii?Q?nYxXA6TYX5xa/6XRfffrxmCvcK3VQBIHAjjKQFPZ0747NwB5QlhkSsyJx0Rw?=
 =?us-ascii?Q?0TXWvHh1FtGA3MVK2ex1/IIqq+DKdZEogAwdtbiUUUQa4phYSKssj3qP1Ibn?=
 =?us-ascii?Q?cX0pyKpTkLJy/tdFKXrym4JTpGee1e67RhL5a2StP8DXDU/p4VVSs3DTDl4z?=
 =?us-ascii?Q?53aI1L5LVTy5BA0CHnB1wriwldunBKiG67AZpqdYWIk7GZcxPb4Y1lEZ5li+?=
 =?us-ascii?Q?Ct5IGQLLAs25PANeG4MTv1a1Tlg5kgIhJ5OrKQXVkF0icfQYAuzXjq6vuxke?=
 =?us-ascii?Q?HmdTM+jPuX5Iq0SoK63QTzzXmTLepQwEgauEtGWD9jFzKVPjdGMpDaQZZaSC?=
 =?us-ascii?Q?nZ69v9PMWmJ+qiNSRDspSY8Q3FjMZ5EHvabxpiFymYcXdi6LQ5bsELvjlBOh?=
 =?us-ascii?Q?87VTCK0RhOA3/JmYu+J1WTHpenM7Jqz17Hy0iV0hrQsrs3Tfl42o58//jD1S?=
 =?us-ascii?Q?EXOTtjUnJtnbdpGaQEpVqk6LX+CfRS9FgNW1A4rklKFVSYOZ8eu2XS71SzGq?=
 =?us-ascii?Q?ZJNbWh149to0JvFnY8KwdGnwRTX3GFzW8TTRKPwpKJXoomZQtZbLmdC4OApg?=
 =?us-ascii?Q?+AS+kcQRZmHnMgcnrqYh2RhcpqKV/Ip1cDST/Xa+pBxHdgdMJT97dnhEDgXx?=
 =?us-ascii?Q?Tm5MgYUpPTHcHCFfFxdRVVNMeqSTcPi48i9RlupQTzaCVzLFhOtK/EDRhfjy?=
 =?us-ascii?Q?uFrfhrqZ0qUaIQ7AXMhJmiDag3TiV3W2iUxD3oEDJo0H3Acn/gw+dVD8ZJGZ?=
 =?us-ascii?Q?zIoYoz1IYtDN+BXIYKMGdbhW65Zyz/CAzSwJFqSHcwIfAFWZHZGnH8xpSycd?=
 =?us-ascii?Q?g6OHrqaoJas65PIvFAjBoIGhkQ91i89R78jMyL/xtDw9UXtJuwuC3oOp2+H4?=
 =?us-ascii?Q?3s/l8xQoe+m2+FGR8o2vZpPxYJE0upCi5tgk0pkZkHapRszEFr5o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f19dd1-3af2-45ac-a3e7-08df12740ec5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 15:22:58.7118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Xgont3u6aD3WTlX4tOh/xDJmv+y6KkOzN5ghqSCTnFMqyILSo3dbMTRPTXpbikwcROgW933rRZSI2w9RMdwZWQZNFYIeXMc7KD41CVGGiRERzb9F5qGkuRLmAT++HT8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11691

On Sun, Sep 13, 2026 at 02:40:22AM +0900, Koichiro Den wrote:
> An endpoint function can reserve an endpoint-local channel while the RC
> programs it through an exposed register window. Such a channel must route
> interrupts remotely and ignore them on the endpoint.
>
> Use dma_slave_config to set per-channel interrupt routing on idle channels
> of a local eDMA or HDMA instance. Releasing a remote-routed channel
> quiesces the hardware and drains its local IRQ before restoring default
> routing.
>
> The eDMA quiesce may stop a complete direction. The caller must own every
> channel in that direction and stop remote programming first.
>
> Suggested-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes in v4:
>   - Drop unnecessary READ_ONCE()/WRITE_ONCE() for irq_mode. (Frank)
>   - Allow repeated dmaengine_slave_config() calls on idle channels
>     when the IRQ mode is unchanged. (Sashiko)
>   - Simplify IRQ mode handling, assuming the channel has no pending
>     interrupt status when its mode changes. Treat racing reads by
>     shared IRQ handlers and same-value stores on release as harmless.
>   - Support native HDMA.
>
>  drivers/dma/dw-edma/dw-edma-core.c | 136 ++++++++++++++++++++++-------
>  include/linux/dma/edma.h           |  21 +++++
>  2 files changed, 125 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index a678c70a78fe..c978da30bac5 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -177,48 +177,76 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
>  						  DW_EDMA_CH_IRQ_REMOTE;
>  }
>
> +static int dw_edma_device_config_irq_mode(struct dw_edma_chan *chan,
> +					  enum dw_edma_ch_irq_mode mode)
> +{
> +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) ||
> +	    (mode != DW_EDMA_CH_IRQ_LOCAL && mode != DW_EDMA_CH_IRQ_REMOTE))
> +		return -EINVAL;
> +
> +	guard(spinlock_irqsave)(&chan->vc.lock);
> +
> +	if (chan->status != EDMA_ST_IDLE || chan->request != EDMA_REQ_NONE)
> +		return -EBUSY;
> +
> +	/* IRQ routing cannot change after the initial configuration. */
> +	if (chan->irq_mode == mode)
> +		return 0;
> +
> +	if (chan->configured)
> +		return -EBUSY;
> +
> +	chan->irq_mode = mode;
> +
> +	return 0;
> +}
> +
>  static int dw_edma_device_config(struct dma_chan *dchan,
>  				 struct dma_slave_config *config)
>  {
> +	const struct dw_edma_chan_config *dw_config = config->peripheral_config;
>  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> -	bool cfg_non_ll;
> -	int non_ll = 0;
> -
> -	chan->non_ll = false;
> -	if (chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE) {
> -		if (config->peripheral_config &&
> -		    config->peripheral_size != sizeof(int)) {
> -			dev_err(dchan->device->dev,
> -				"config param peripheral size mismatch\n");
> +	bool non_ll = false;
> +	u32 flags = 0;
> +	int ret;
> +
> +	if (dw_config) {
> +		if (config->peripheral_size != sizeof(*dw_config) ||
> +		    dw_config->flags & ~(DW_EDMA_CH_CONFIG_NON_LL |
> +					 DW_EDMA_CH_CONFIG_IRQ_MODE))
>  			return -EINVAL;
> -		}
> +		flags = dw_config->flags;
> +	}
>
> -		/*
> -		 * When there is no valid LLP base address available then the
> -		 * default DMA ops will use the non-LL mode.
> -		 *
> -		 * Cases where LL mode is enabled and client wants to use the
> -		 * non-LL mode then also client can do so via providing the
> -		 * peripheral_config param.
> -		 */
> -		cfg_non_ll = chan->dw->chip->cfg_non_ll;
> -		if (config->peripheral_config) {
> -			non_ll = *(int *)config->peripheral_config;
> +	/*
> +	 * When there is no valid LLP base address available then the
> +	 * default DMA ops will use the non-LL mode.
> +	 *
> +	 * When LL mode is the default, clients can request non-LL mode
> +	 * through DW_EDMA_CH_CONFIG_NON_LL.
> +	 */
> +	non_ll = chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE &&
> +		 chan->dw->chip->cfg_non_ll;
>
> -			if (cfg_non_ll && !non_ll) {
> -				dev_err(dchan->device->dev, "invalid configuration\n");
> -				return -EINVAL;
> -			}
> +	if (flags & DW_EDMA_CH_CONFIG_NON_LL) {
> +		if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE)
> +			return -EINVAL;
> +
> +		if (chan->dw->chip->cfg_non_ll && !dw_config->non_ll) {
> +			dev_err(dchan->device->dev, "invalid configuration\n");
> +			return -EINVAL;
>  		}
>
> -		if (cfg_non_ll || non_ll)
> -			chan->non_ll = true;
> -	} else if (config->peripheral_config) {
> -		dev_err(dchan->device->dev,
> -			"peripheral config param applicable only for HDMA\n");
> -		return -EINVAL;
> +		non_ll = dw_config->non_ll;
> +	}
> +
> +	if (flags & DW_EDMA_CH_CONFIG_IRQ_MODE) {
> +		ret = dw_edma_device_config_irq_mode(chan, dw_config->irq_mode);
> +		if (ret)
> +			return ret;
>  	}
>
> +	chan->non_ll = non_ll;
>  	memcpy(&chan->config, config, sizeof(*config));
>  	chan->configured = true;
>
> @@ -890,11 +918,53 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
>  		 "timeout waiting for channel termination\n");
>  }
>
> +static void dw_edma_synchronize_chan_irq(struct dw_edma_chan *chan)
> +{
> +	struct dw_edma *dw = chan->dw;
> +	unsigned long *mask;
> +	int i;
> +
> +	/*
> +	 * A shared handler may retain this channel's status across quiesce.
> +	 * With nr_irqs == 1, it scans both directions even if routing and
> +	 * delegation are direction-wide. Drain it before allowing a routing change.
> +	 */
> +	for (i = 0; i < dw->nr_irqs; i++) {
> +		mask = chan->dir == EDMA_DIR_WRITE ? dw->irq[i].wr_mask :
> +						     dw->irq[i].rd_mask;
> +		if (!test_bit(chan->id, mask))
> +			continue;
> +
> +		synchronize_irq(dw->chip->ops->irq_vector(dw->chip->dev, i));
> +		return;
> +	}
> +}
> +
>  static void dw_edma_device_synchronize(struct dma_chan *dchan)
>  {
>  	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
> +	bool remote;
> +
> +	/*
> +	 * irq_mode is fixed after initial configuration. The free path
> +	 * restores it only after synchronization.
> +	 */
> +	remote = chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL &&
> +		 chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
> +
> +	/*
> +	 * Peer-driven transfers bypass local descriptor tracking, so quiesce
> +	 * the hardware explicitly.
> +	 */
> +	if (remote && dw_edma_core_ch_quiesce(chan))
> +		dev_warn(chan->dw->chip->dev,
> +			 "failed to quiesce remote-routed %s channel %u\n",
> +			 chan->dir == EDMA_DIR_WRITE ? "write" : "read",
> +			 chan->id);
>
>  	dw_edma_wait_termination(dchan);
> +	if (remote)
> +		dw_edma_synchronize_chan_irq(chan);
>  	cancel_work_sync(&chan->irq_work);
>  	atomic_set(&chan->irq_pending, 0);
>  	vchan_synchronize(&chan->vc);
> @@ -907,8 +977,10 @@ static void dw_edma_free_chan_resources(struct dma_chan *dchan)
>  	dw_edma_device_terminate_all(dchan);
>  	dw_edma_device_synchronize(dchan);
>
> -	scoped_guard(spinlock_irqsave, &chan->vc.lock)
> +	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
>  		chan->configured = false;
> +		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
> +	}
>
>  	vchan_free_chan_resources(&chan->vc);
>  }
> diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
> index 3c8e2ef9dee0..43831fa57357 100644
> --- a/include/linux/dma/edma.h
> +++ b/include/linux/dma/edma.h
> @@ -101,6 +101,27 @@ enum dw_edma_ch_irq_mode {
>  	DW_EDMA_CH_IRQ_REMOTE,
>  };
>
> +#define DW_EDMA_CH_CONFIG_NON_LL	BIT(0)
> +#define DW_EDMA_CH_CONFIG_IRQ_MODE	BIT(1)
> +
> +/**
> + * struct dw_edma_chan_config - dw-edma channel configuration
> + * @flags: fields selected by DW_EDMA_CH_CONFIG_*
> + * @non_ll: use HDMA non-linked-list mode
> + * @irq_mode: interrupt routing mode
> + *
> + * Pass this structure through dma_slave_config.peripheral_config. Before
> + * synchronizing a remote-routed channel, the client must stop remote
> + * programming and own every channel affected by the hardware quiesce: the
> + * entire direction for eDMA-compatible layouts, or the individual channel for
> + * native HDMA.
> + */
> +struct dw_edma_chan_config {
> +	u32 flags;
> +	bool non_ll;
> +	enum dw_edma_ch_irq_mode irq_mode;
> +};
> +

Do you have any user in kernel tree use non_ll?

Frank

>  /**
>   * struct dw_edma_chip - representation of DesignWare eDMA controller hardware
>   * @dev:		 struct device of the eDMA controller
> --
> 2.51.0
>
