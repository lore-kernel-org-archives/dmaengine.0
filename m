Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79149424D5A;
	Thu,  1 Oct 2026 06:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790834876; cv=fail; b=U6Q6D4C+nF4ptBbG463WXQBX8oLjV7WG36aS92WPJy8z0pnRx6sv1btjkK22bl6Wwal2NO66xjDLwcpRextXwaQRgYQoXbWJjhnT+l3Iokhz0g0NPad3qAslSvzpThB6QSzLCJVBit07YS856Yz9qB8bOSiLV5d7GnpYH+9/yY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790834876; c=relaxed/simple;
	bh=bBkajJZOiN2eelBtPWHdVYTCsXpENmMpSt6xPd4cbLs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UFeidQb0kJs17xgsXOmZklzknEyp826NuqzvDojgN6qp8s8nfICFq/oUK1PHlCJsycKBZ+70Bd7i28zSDKC38ud1wWEm+FwCzfH4IaefHO/r9vNZk8DZmUNVRe+Hj7hAKtNiEmKSuxqtYUiy9r8iuOBc/iGyk81K3JzEqQ5UVYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2lZFuSSy; arc=fail smtp.client-ip=40.107.209.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2lZFuSSy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wizg5hz4/Py/m2QB1X5Uit/rfUx0j5LkhlmPh/mvFs62Awollu+PK2AgQ47EJ9sYoDTAxYFHhNvEtpdNbva/HwyA7rOoORU8QI3gqT0Gc4sD9wcCOJu7NZwuzkOgfSriOLQs6EDvdoO+hfkK1mz6f1Ym4TNbZCLfHSzd2VSzGhi+LPoQ2DPOf5+oEyZ1sM/2iJZiQcOTASRksME5Gyxprm+dnJ3qZZZ2pYFW7EzfdSOyctXggkhF4jq2sHOW9vOMJw9LLYzh8AcWTHA1cUjXAuJxeQSNmN9RegtylIik5hm/T5dBEA6ACr3Klb1wB6p+yAW7cZOjcdwDLnOzLickQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxE3f4zC3eOYYXnTJwyXLNiWJ81nuCDxTW93u8i1J4w=;
 b=GfF4wkN67eI1RoEcG9QxgHjcTziIweLNRexiaDzc1PNxbLJ5qfsGOYGVees14SCoNle+nQQ6en6v5fOI7y3uEEgyHJ2FK90rFpSCi8/bW9VOBkyLhkaJAxzDFkrgBD3yI/HTFnTgMhhkdZS4bHZzBKDPUBclobosy99tWPKLmIIuJLq7YU8GnAPn4O3vLcl+/ZYpD8sxWpJdTex7Zj4fiV2g5eXT2Ih45RvPzBdsn2y58LPs4IHGh4A8N4dkpI//tx75iuQAvkd/dnkmDRrjFMMuV2pix3aYiYPg0BviT3OrAPCrFgt3SrJ730qy709Rs4PLspDXyJqXkbXg7EXHNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxE3f4zC3eOYYXnTJwyXLNiWJ81nuCDxTW93u8i1J4w=;
 b=2lZFuSSyYONW3Gtq7KeRKckCe1vxK65lmyQTLsCeQEA4+ZzXDGYHqRsRomO3DMF6MnoiI0ZhKLXW6NjVqXK9DJiNLhBD62uF9fRbZnhGJFn9Lz+WVzJY8lCpJLhT/Pr4oS/7ggsrge56laLeE0TkS+/ewLalE/uIArM/z0zcaEQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB9076.namprd12.prod.outlook.com (2603:10b6:510:2f6::21)
 by IA0PPF84D37DD5C.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 06:07:51 +0000
Received: from PH7PR12MB9076.namprd12.prod.outlook.com
 ([fe80::c295:127b:4e18:6053]) by PH7PR12MB9076.namprd12.prod.outlook.com
 ([fe80::c295:127b:4e18:6053%5]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 06:07:51 +0000
Message-ID: <c135d818-ec8f-4c9c-9345-9be40675dfb2@amd.com>
Date: Thu, 1 Oct 2026 11:37:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dmaengine: dw-edma: Configure remote interrupt
 routing
To: Frank Li <Frank.li@oss.nxp.com>, Koichiro Den <den@valinux.co.jp>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, devverma@amd.com
References: <20260912174023.1227397-1-den@valinux.co.jp>
 <20260912174023.1227397-3-den@valinux.co.jp> <aqgRSbIFDuMOKkzF@SMW015318>
 <muwficrvayllrqlgfrgn5rqjvwo4dxghriqzhrh6fqeu3gjrst@rla66stbftvg>
 <l4ujqwjxdolhfkqvgyxgoh4yf6c73ddpew2flyeqszpshwbox3@y7vuhyurodo7>
 <ar1wViPPc6LYi5po@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: "Verma, Devendra" <devverma@amd.com>
In-Reply-To: <ar1wViPPc6LYi5po@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::15) To PH7PR12MB9076.namprd12.prod.outlook.com
 (2603:10b6:510:2f6::21)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB9076:EE_|IA0PPF84D37DD5C:EE_
X-MS-Office365-Filtering-Correlation-Id: d334e2f8-8c79-442b-4327-08df1f825331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	u2MmVZ9TyWPXfREv0DLr/mcxFZWc/lb6gAvb0SxX5UfWAygMX03W5U6WxkbKDm/LqZ821c1xavawx6egFA+FwYOwywSpWnL41ZgbKfDCUeFd2ny0eazhDcFw8FA4QTQGr2Eo0U3LE9wPIA7akQWE6OlYvimE4U0w332WLkgFUBYjZNieJu+dQQ1x3pXTOfgtzoB8HQDuCGLASF87Xxh+4Dl8eEJK7CYo5bVTQ2E/0j39Ol+7yDyf4W0G6S6jECbEvC8W3bQx9EjVWlSexkMXfrv0p4tGZXQMW3mBJe85X92zSHB/wEpXLCfdemnW80tVjNBKKujlGma1F8T8cql/aZ3AdgIHUgA4ijnpVLIQ2VJBQkmq29+0h3nEL5gEeTT8TxUz3ol7JVPhVqh+SIeXl4P9lxhXFugStxUu5W3A4nEJi6PBrO3kdfnI5C6uSGvop8Y8WR3NP6ujv5AkPFcJ0y37iKlPrZHJfEQis7D/6VwnL2TziPLS66Qe83Hi6vtuOGqw5vbIhbfW/PUh8wwxw9/PpuxEmRCR5guevcDxfrxHXnuw8Htmmq6/5fHe51NTi/erI2yf2yJeHfgE6EbMKzRxyR6PuadQZnX/gCpw/dLQRhGsg9dImy9L3JGsGccB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB9076.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWo2SFBPZUgxMmc3QWt4ejNMaXhjQ0thb1REYXFYS1NBWDZRbk1RWjhieVJj?=
 =?utf-8?B?WWNzS3ZPRGFTRzBmSHY4T2srbHBrdGxOSUxiM1d0Mldid2J0Nm52UURqNUt4?=
 =?utf-8?B?VjUyd2RmajBpR2lic0pQcHZlOEpkWnA2WEN1dnduT1NEZjZONVZudjh4RjJz?=
 =?utf-8?B?ekxzb2xPZWtLMXExNGdiNHRpdStTdVBNRkNEaWZsZHVYYm1hSkdPSFJzWU13?=
 =?utf-8?B?OGMvTzIwbVRpdWxxU3VCSEdQQW1IM1pTdGg1UkRSNTJmbG9OZnZsTm8rNmVG?=
 =?utf-8?B?RDVOVUlLVjA5bEdzUENoSkE5T0ljWHlyV2ptczdTOGxwZDFWMG9FL2VDem4w?=
 =?utf-8?B?Ym02Q01SMG9OSDROMldvazVzSFoyTE91S2xsVjNDMkJ0SXNZOWQxeVovQm15?=
 =?utf-8?B?cVBiOXNLeWdHSUtkSGFDcW1TQktYczdWSm5ma3EwMTJRbW83cU5jck1jZU9r?=
 =?utf-8?B?U1VrUElZd1JGTHRHZzluTE5VQzZxR2IwY096R0Z3V0lvTkxQYWI5dGp2amtu?=
 =?utf-8?B?VTc3M2Q3U3daWXRLY1NGWnpDY3B1T1VXNjlyWXVFZzJSZG1BWUJEcmx6clY3?=
 =?utf-8?B?REhVdHQ0b0dhYm5JVWNpVTM1VjVWd2gwMWxoVEJGYXJNbkxlbUN0MEcrbGZj?=
 =?utf-8?B?N3grTGI5emxGa3lPR1RUR3FhVC9rSFAxcVg3aFpLVVFzVEF6dG1QMUZPRmhs?=
 =?utf-8?B?UjFoaU1xelhPM2N5YlFmUnYxTHBrVXR6bzlWQ2duK1ZTbXU2cmxzN2J2VWEr?=
 =?utf-8?B?bUNlb3VHclVXVlZxM1ZaSUZBUUtNNTFpL2lMNU5mMFJKSGZNcHFuYkxoMThO?=
 =?utf-8?B?MWZKU0ZzY25oQ2oveGNiaGVIRDhFTlMxUDR5Nm5WNDMwbm5Pd2VKbXlmbWRo?=
 =?utf-8?B?aXBVR2tGRjhBMllqN0prU1B1TzJranZUWEF5N211NHFoY082aVlObnhlTEJy?=
 =?utf-8?B?VWJXMlNFa3BqdWduYXpOcGlIN2VOYkI3NjZtRXRPYTA1clYzOUEyTHN3cDZS?=
 =?utf-8?B?aUlYaEwydUhYOEE3d3NZbXdVT0Ivc0ZpRm9ZdnJYQ1lMd1pNY0FjREVkTjhm?=
 =?utf-8?B?dWtkUmdndzgzWUNxdUhWS3ZXU1Fzb1FIeVgxUmVzZ1JpczhUWjVoSU9GVkM4?=
 =?utf-8?B?Q2QxMmhXMkREbE8zK25GVmFYZlRxQmFEanRyWENmajEvNVpwNWlVMWcyODFt?=
 =?utf-8?B?MzI2TUhBUWIycWVGcHJBSzJrUm5VdHJndFY2YlM0RVN3ZGxUM3lkbUp3dDF6?=
 =?utf-8?B?SEgyVGl0UXI2U21yYmxHZWtjN2Voa2ZRRkI3cHVjQ0lOdy8rK21OaUthQ3Bp?=
 =?utf-8?B?Q0dDL0VjcnU3ZS9OMlpwKzB2SlhjMXFyeGNxZFNJK1dOVmVyNGxzL3ArMmdj?=
 =?utf-8?B?TENtb0dtUTVIbm5ET3grVzNQYldxR3M3a0N0TXFHV01WcXk2aExMbGhnUWpo?=
 =?utf-8?B?SGpuY3JRUXI2ZVNnUldxSEw5elVtWGIrVHBVUkpqZHl4OWE3dllZMnlXVnUw?=
 =?utf-8?B?UlUvaHZEc1ozZ0s4QXZyZU9hSFZMUjhjMHpoMDRGWVd3R1JQeUovMmNvVHpv?=
 =?utf-8?B?REVqQkdsOHZxelJjbnhkR0Z0QTBzcHZDWWNINlF2ZFJGRGVSNXdmRG10R25Q?=
 =?utf-8?B?S0w4MXdxalVxMVk2OFJqb0tIYnQ2cy9uU2VvZk5CK0JETGo1QndRRHU0UzQ4?=
 =?utf-8?B?UnhpSkxSbnhJYVhaaEFmK1h6M1BXYktOTkhOWnZENzQvYnc1SHowTUZqKzVH?=
 =?utf-8?B?Q2grYkdyRTRtQWw0REprS0dkUzVkWHU4RnlvNkJqRnRFOFFyR2pzOVpSM2hj?=
 =?utf-8?B?ZXcvSjkyVFVLd1FMam56Zlp0L0FxVGNCVHNwZUxwN3JVU0x4Z1lZaC9vWm83?=
 =?utf-8?B?UlBpUUFwTEQvYVhLaXFFVWc1YnFCUlY1V2lJQ1VNU04vaXBsVVB0alhPSHo1?=
 =?utf-8?B?dmxZMkFXSjB6QkFFdUdFTnF1eHR1Sm9RL3ZHemRqMG5uUkhrZU5kN0pDVUtR?=
 =?utf-8?B?TkJHc1puUVBJR0FoYTBiSlBaeW0yK1N6ZE9DWi8zbTRFc0Z0eHpHcUpPblNC?=
 =?utf-8?B?Smt1ekxKNXRtNjlZbkpZUmRrQUhaVVRBYWJPcHhVamN1bWZSTUV2Tkc2TWdj?=
 =?utf-8?B?bVd1RE05UTRPR2NKdGE5WHpMVXh6dWFGNklhTlVjaE0ySDBVd0MzSUYwaHl5?=
 =?utf-8?B?bElSK21PTTByVzc4dEU2bnF3dmw4c201Q3Bab0k1ZGJNdGJEWjVDdmRRdEkr?=
 =?utf-8?B?dDhYUEtTaVJ0alBhSFNUOU1DQW5zcUJDeERiZTN5dEtEaGJ2ejFXb2srcERj?=
 =?utf-8?B?bENtRk5RYzNaZ1REV1VsMmdkdlkxRThLRmZ5bCt1cVYzVlNQT2pEQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d334e2f8-8c79-442b-4327-08df1f825331
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB9076.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 06:07:51.5616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nrBPpaKFXYQuEYvtH9ba2eEup8uCrNkufXRA7I+J30DyHIOPOFw8uXjt48UODO3KX95PDNqDFexc+Gr/ADk0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF84D37DD5C

On 01-Oct-26 01:55, Frank Li wrote:
> On Tue, Sep 15, 2026 at 12:53:33AM +0900, Koichiro Den wrote:
>> On Tue, Sep 15, 2026 at 12:49:01AM +0900, Koichiro Den wrote:
>>> On Mon, Sep 14, 2026 at 10:22:49AM -0500, Frank Li wrote:
>>>> On Sun, Sep 13, 2026 at 02:40:22AM +0900, Koichiro Den wrote:
>>>>> An endpoint function can reserve an endpoint-local channel while the RC
>>>>> programs it through an exposed register window. Such a channel must route
>>>>> interrupts remotely and ignore them on the endpoint.
>>>>>
>>>>> Use dma_slave_config to set per-channel interrupt routing on idle channels
>>>>> of a local eDMA or HDMA instance. Releasing a remote-routed channel
>>>>> quiesces the hardware and drains its local IRQ before restoring default
>>>>> routing.
>>>>>
>>>>> The eDMA quiesce may stop a complete direction. The caller must own every
>>>>> channel in that direction and stop remote programming first.
>>>>>
>>>>> Suggested-by: Frank Li <Frank.Li@nxp.com>
>>>>> Signed-off-by: Koichiro Den <den@valinux.co.jp>
>>>>> ---
>>>>> Changes in v4:
>>>>>    - Drop unnecessary READ_ONCE()/WRITE_ONCE() for irq_mode. (Frank)
>>>>>    - Allow repeated dmaengine_slave_config() calls on idle channels
>>>>>      when the IRQ mode is unchanged. (Sashiko)
>>>>>    - Simplify IRQ mode handling, assuming the channel has no pending
>>>>>      interrupt status when its mode changes. Treat racing reads by
>>>>>      shared IRQ handlers and same-value stores on release as harmless.
>>>>>    - Support native HDMA.
>>>>>
>>>>>   drivers/dma/dw-edma/dw-edma-core.c | 136 ++++++++++++++++++++++-------
>>>>>   include/linux/dma/edma.h           |  21 +++++
>>>>>   2 files changed, 125 insertions(+), 32 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
>>>>> index a678c70a78fe..c978da30bac5 100644
>>>>> --- a/drivers/dma/dw-edma/dw-edma-core.c
>>>>> +++ b/drivers/dma/dw-edma/dw-edma-core.c
>>>>> @@ -177,48 +177,76 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
>>>>>   						  DW_EDMA_CH_IRQ_REMOTE;
>>>>>   }
>>>>>
>>>>> +static int dw_edma_device_config_irq_mode(struct dw_edma_chan *chan,
>>>>> +					  enum dw_edma_ch_irq_mode mode)
>>>>> +{
>>>>> +	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) ||
>>>>> +	    (mode != DW_EDMA_CH_IRQ_LOCAL && mode != DW_EDMA_CH_IRQ_REMOTE))
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	guard(spinlock_irqsave)(&chan->vc.lock);
>>>>> +
>>>>> +	if (chan->status != EDMA_ST_IDLE || chan->request != EDMA_REQ_NONE)
>>>>> +		return -EBUSY;
>>>>> +
>>>>> +	/* IRQ routing cannot change after the initial configuration. */
>>>>> +	if (chan->irq_mode == mode)
>>>>> +		return 0;
>>>>> +
>>>>> +	if (chan->configured)
>>>>> +		return -EBUSY;
>>>>> +
>>>>> +	chan->irq_mode = mode;
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>>   static int dw_edma_device_config(struct dma_chan *dchan,
>>>>>   				 struct dma_slave_config *config)
>>>>>   {
>>>>> +	const struct dw_edma_chan_config *dw_config = config->peripheral_config;
>>>>>   	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
>>>>> -	bool cfg_non_ll;
>>>>> -	int non_ll = 0;
>>>>> -
>>>>> -	chan->non_ll = false;
>>>>> -	if (chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE) {
>>>>> -		if (config->peripheral_config &&
>>>>> -		    config->peripheral_size != sizeof(int)) {
>>>>> -			dev_err(dchan->device->dev,
>>>>> -				"config param peripheral size mismatch\n");
>>>>> +	bool non_ll = false;
>>>>> +	u32 flags = 0;
>>>>> +	int ret;
>>>>> +
>>>>> +	if (dw_config) {
>>>>> +		if (config->peripheral_size != sizeof(*dw_config) ||
>>>>> +		    dw_config->flags & ~(DW_EDMA_CH_CONFIG_NON_LL |
>>>>> +					 DW_EDMA_CH_CONFIG_IRQ_MODE))
>>>>>   			return -EINVAL;
>>>>> -		}
>>>>> +		flags = dw_config->flags;
>>>>> +	}
>>>>>
>>>>> -		/*
>>>>> -		 * When there is no valid LLP base address available then the
>>>>> -		 * default DMA ops will use the non-LL mode.
>>>>> -		 *
>>>>> -		 * Cases where LL mode is enabled and client wants to use the
>>>>> -		 * non-LL mode then also client can do so via providing the
>>>>> -		 * peripheral_config param.
>>>>> -		 */
>>>>> -		cfg_non_ll = chan->dw->chip->cfg_non_ll;
>>>>> -		if (config->peripheral_config) {
>>>>> -			non_ll = *(int *)config->peripheral_config;
>>>>> +	/*
>>>>> +	 * When there is no valid LLP base address available then the
>>>>> +	 * default DMA ops will use the non-LL mode.
>>>>> +	 *
>>>>> +	 * When LL mode is the default, clients can request non-LL mode
>>>>> +	 * through DW_EDMA_CH_CONFIG_NON_LL.
>>>>> +	 */
>>>>> +	non_ll = chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE &&
>>>>> +		 chan->dw->chip->cfg_non_ll;
>>>>>
>>>>> -			if (cfg_non_ll && !non_ll) {
>>>>> -				dev_err(dchan->device->dev, "invalid configuration\n");
>>>>> -				return -EINVAL;
>>>>> -			}
>>>>> +	if (flags & DW_EDMA_CH_CONFIG_NON_LL) {
>>>>> +		if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE)
>>>>> +			return -EINVAL;
>>>>> +
>>>>> +		if (chan->dw->chip->cfg_non_ll && !dw_config->non_ll) {
>>>>> +			dev_err(dchan->device->dev, "invalid configuration\n");
>>>>> +			return -EINVAL;
>>>>>   		}
>>>>>
>>>>> -		if (cfg_non_ll || non_ll)
>>>>> -			chan->non_ll = true;
>>>>> -	} else if (config->peripheral_config) {
>>>>> -		dev_err(dchan->device->dev,
>>>>> -			"peripheral config param applicable only for HDMA\n");
>>>>> -		return -EINVAL;
>>>>> +		non_ll = dw_config->non_ll;
>>>>> +	}
>>>>> +
>>>>> +	if (flags & DW_EDMA_CH_CONFIG_IRQ_MODE) {
>>>>> +		ret = dw_edma_device_config_irq_mode(chan, dw_config->irq_mode);
>>>>> +		if (ret)
>>>>> +			return ret;
>>>>>   	}
>>>>>
>>>>> +	chan->non_ll = non_ll;
>>>>>   	memcpy(&chan->config, config, sizeof(*config));
>>>>>   	chan->configured = true;
>>>>>
>>>>> @@ -890,11 +918,53 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
>>>>>   		 "timeout waiting for channel termination\n");
>>>>>   }
>>>>>
>>>>> +static void dw_edma_synchronize_chan_irq(struct dw_edma_chan *chan)
>>>>> +{
>>>>> +	struct dw_edma *dw = chan->dw;
>>>>> +	unsigned long *mask;
>>>>> +	int i;
>>>>> +
>>>>> +	/*
>>>>> +	 * A shared handler may retain this channel's status across quiesce.
>>>>> +	 * With nr_irqs == 1, it scans both directions even if routing and
>>>>> +	 * delegation are direction-wide. Drain it before allowing a routing change.
>>>>> +	 */
>>>>> +	for (i = 0; i < dw->nr_irqs; i++) {
>>>>> +		mask = chan->dir == EDMA_DIR_WRITE ? dw->irq[i].wr_mask :
>>>>> +						     dw->irq[i].rd_mask;
>>>>> +		if (!test_bit(chan->id, mask))
>>>>> +			continue;
>>>>> +
>>>>> +		synchronize_irq(dw->chip->ops->irq_vector(dw->chip->dev, i));
>>>>> +		return;
>>>>> +	}
>>>>> +}
>>>>> +
>>>>>   static void dw_edma_device_synchronize(struct dma_chan *dchan)
>>>>>   {
>>>>>   	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
>>>>> +	bool remote;
>>>>> +
>>>>> +	/*
>>>>> +	 * irq_mode is fixed after initial configuration. The free path
>>>>> +	 * restores it only after synchronization.
>>>>> +	 */
>>>>> +	remote = chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL &&
>>>>> +		 chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
>>>>> +
>>>>> +	/*
>>>>> +	 * Peer-driven transfers bypass local descriptor tracking, so quiesce
>>>>> +	 * the hardware explicitly.
>>>>> +	 */
>>>>> +	if (remote && dw_edma_core_ch_quiesce(chan))
>>>>> +		dev_warn(chan->dw->chip->dev,
>>>>> +			 "failed to quiesce remote-routed %s channel %u\n",
>>>>> +			 chan->dir == EDMA_DIR_WRITE ? "write" : "read",
>>>>> +			 chan->id);
>>>>>
>>>>>   	dw_edma_wait_termination(dchan);
>>>>> +	if (remote)
>>>>> +		dw_edma_synchronize_chan_irq(chan);
>>>>>   	cancel_work_sync(&chan->irq_work);
>>>>>   	atomic_set(&chan->irq_pending, 0);
>>>>>   	vchan_synchronize(&chan->vc);
>>>>> @@ -907,8 +977,10 @@ static void dw_edma_free_chan_resources(struct dma_chan *dchan)
>>>>>   	dw_edma_device_terminate_all(dchan);
>>>>>   	dw_edma_device_synchronize(dchan);
>>>>>
>>>>> -	scoped_guard(spinlock_irqsave, &chan->vc.lock)
>>>>> +	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
>>>>>   		chan->configured = false;
>>>>> +		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
>>>>> +	}
>>>>>
>>>>>   	vchan_free_chan_resources(&chan->vc);
>>>>>   }
>>>>> diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
>>>>> index 3c8e2ef9dee0..43831fa57357 100644
>>>>> --- a/include/linux/dma/edma.h
>>>>> +++ b/include/linux/dma/edma.h
>>>>> @@ -101,6 +101,27 @@ enum dw_edma_ch_irq_mode {
>>>>>   	DW_EDMA_CH_IRQ_REMOTE,
>>>>>   };
>>>>>
>>>>> +#define DW_EDMA_CH_CONFIG_NON_LL	BIT(0)
>>>>> +#define DW_EDMA_CH_CONFIG_IRQ_MODE	BIT(1)
>>>>> +
>>>>> +/**
>>>>> + * struct dw_edma_chan_config - dw-edma channel configuration
>>>>> + * @flags: fields selected by DW_EDMA_CH_CONFIG_*
>>>>> + * @non_ll: use HDMA non-linked-list mode
>>>>> + * @irq_mode: interrupt routing mode
>>>>> + *
>>>>> + * Pass this structure through dma_slave_config.peripheral_config. Before
>>>>> + * synchronizing a remote-routed channel, the client must stop remote
>>>>> + * programming and own every channel affected by the hardware quiesce: the
>>>>> + * entire direction for eDMA-compatible layouts, or the individual channel for
>>>>> + * native HDMA.
>>>>> + */
>>>>> +struct dw_edma_chan_config {
>>>>> +	u32 flags;
>>>>> +	bool non_ll;
>>>>> +	enum dw_edma_ch_irq_mode irq_mode;
>>>>> +};
>>>>> +
>>>>
>>>> Do you have any user in kernel tree use non_ll?
>>>
>>> I don't think so.
>>>
>>> Devendra, I would appreciate your input here, if you have any thoughts on
>>> Frank's question, or the new dw_edma_chan_config. I haven't found any in-tree
>>> user of the non-LL peripheral_config interface introduced here:
>>> https://lore.kernel.org/r/20260318070403.1634706-3-devendra.verma@amd.com/
>>> so I guess any users would be out-of-tree at least as of now, unless I'm missing
>>> something.
>>
>> Ouch, I meant to put Devendra in To, not Cc. Sorry for the noise.
> 
> Consider not in-tree non-ll consumer. It should be fine to change API.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 

Hi Koichiro, Frank

Thank you for your patience!
I was out for few weeks. To your question, there are no users in
the kernel tree for non_ll case via the dmaengine_slave_config().

- Devendra

>>
>> Best regards,
>> Koichiro
>>
>>>
>>> Best regards,
>>> Koichiro
>>>
>>>>
>>>> Frank
>>>>
>>>>>   /**
>>>>>    * struct dw_edma_chip - representation of DesignWare eDMA controller hardware
>>>>>    * @dev:		 struct device of the eDMA controller
>>>>> --
>>>>> 2.51.0
>>>>>

