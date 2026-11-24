Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795543078;
	b=VCjurxkc7lSpOOSOruIqdeBg/JkX9Dgko6imR1oPrMXwttECSQQl3YimoeKn82CtX6XK
	 C1m8JLDfeTOqmICfgKPZ4Bstygg7gGuK/2kNJDuWGkD+YeEBMJjeKOE7aORlykXWh3Vfc
	 7p/14/X4WAHC1K19VP4vopqw+2ZDMoi3kxfjHwdGR0Nq6ggkliqbV4TFEF/jjtE2DAdbR
	 TkRPz/JAOi8+vTPhrAFMnuzfHJw8qrv2hXL3mA+7VafPwfPSb/B7sZrdXZpmplttOnG8B
	 Tamccs6WsiZd7lVM+usl2MdwWrfx7uvvLUXWAfSbgG4eGc5E0W4+F0QxLLj/srQFjVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543078;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:CC:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ltTURVc/B61NB8M+NPxaLWlyjRFzLAwlBdJe1DTkHmk=;
	b=q8NMKorTNfgL+p3nj/TJabHGLTKrCAusqI3AlItCE0nqseWjtwwxBdqOgXDQUz6lM8CC
	 YR0iDzAwsJpjKBDHo3wIe6m6WLtYWjsDlfigfrX1fl+YnAILlc/sePCplehKckUxT72LB
	 JVSgDPAxxjN1jTyA8X0jyn5LA/7ynEcLS9usuiJxGiZI/2jpQUtbjykxSTxranMyvMgg7
	 J6A3rF3B36Ai38uwTTIGHBqD0D6okTtkhYvFXKEMJJl9PNrDL4cwB9MTHuBbvmCfHtxqW
	 FoyBdRj7gIg992YO9LglIAauHl2re+UPWvVVtTdpK+F/fusredcaZWmHeMoAXfBjMZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IxRSbBN9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.6
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013006.outbound.protection.outlook.com [40.93.201.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C102606A31E
	for <dmaengine@vger.kernel.org>; Tue, 24 Nov 2026 17:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C102606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IxRSbBN9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfaVr+P/zghkKGx7zyjZL9kdbwrBIEZ7pIRvr3Z1cgO4aBLTJCVZjRc/k4rYrZQz3HFbeUxdMdADQPaoiHemg/ipaortcSt7A067SIyq2Q6FU6Ic74gh3n6Qh5RI28/ip7gtGXAJU0yNnAoHb9a6eKtTUqqtT9i0ePTI9+c9FZzcTCjzrHIb0TckXmYCoQWCzkdaK7nAnOrRNPxzoe6uaulgFTjTguUWCawFZvw5GGc7jXmkx+h2cZBN8s7FfEWMIWKiQcF/EEUv1k+Gc76iEABJRlpD4QWXNWPqBjYrAC3HJ6AIMtk5cM1VxVZXit+kfuda4XgqD6UjqKvzRYhnrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltTURVc/B61NB8M+NPxaLWlyjRFzLAwlBdJe1DTkHmk=;
 b=tOp86w57dhdWPKfGgYkdHWW4+Sax/3/+BTeANWuafgD6N4s5NXw9kcEdbVtXID0wbCABFREBj/GS6YAK76ZuQsDhPjXMT9VesX9W/Gkrzhhp6oO7Q5p6WP8FDKGupZ4E8QHvUpEbw+3AttDSOAzivEdTdiSpDJP7Lo7ZlovjMrv54LQG3cAMlrm3onk7l3iACrXj5QYiovy/dScWMG4Dk2R5VFlTVMP65AAwCKUKIf2e1Ci5FtqDckMri7e/BVPHTONNaJep5B7iwTbvby8CIZ8FkRVsLFYu9r28ps3Es/ZAzORNBNq464eDLM+BjhH66SxnXRagmziyb+hq8kyM1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gpxsee.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltTURVc/B61NB8M+NPxaLWlyjRFzLAwlBdJe1DTkHmk=;
 b=IxRSbBN98cwnQTzGsTVzURMLJxlKqTjuXnwQj6QnYBqOeXANwIQsCcXke23ayX9qqhB96OpIDrJSqQVdn1HTk4/EEVmYcW3VLveZ8HJK53WcEj533YXBRNbQ+6l9/crcQzuhdY3B6N2HJCwti00znLNNC4dW3g8myLerxcvWxTE=
Received: from MW4PR03CA0293.namprd03.prod.outlook.com (2603:10b6:303:b5::28)
 by CH3PR12MB8726.namprd12.prod.outlook.com (2603:10b6:610:17b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 17:57:52 +0000
Received: from BY1PEPF00026957.namprd05.prod.outlook.com
 (2603:10b6:303:b5:cafe::10) by MW4PR03CA0293.outlook.office365.com
 (2603:10b6:303:b5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 17:57:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026957.mail.protection.outlook.com (10.167.244.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 17:57:51 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 11:57:48 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 11:57:48 -0600
Message-ID: <2e8444da-ad9f-033c-c22d-400b27bf0d76@amd.com>
Date: Tue, 24 Nov 2026 09:57:47 -0800
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/1] dmaengine: xilinx: xdma: Fix broken PM
 suspend/resume
Content-Language: en-US
To: =?UTF-8?Q?Martin_T=c5=afma?= <tumic@gpxsee.org>, Brian Xu
	<brian.xu@amd.com>, Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, "Vinod
 Koul" <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Michal Simek
	<michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	=?UTF-8?Q?Martin_T=c5=afma?= <martin.tuma@digiteqautomotive.com>
References: <20261120172356.5858-1-tumic@gpxsee.org>
 <20261120172356.5858-2-tumic@gpxsee.org>
 <754c498c-7252-3f2b-54e6-3ebfdf0181ff@amd.com>
 <47182dbe-018a-4ca6-b20c-f6e2afa5f474@gpxsee.org>
 <c7f5a712-a2ca-2424-cc63-d262c21d5381@amd.com>
 <dce94458-c9bc-4762-902c-7094d9bdc3c8@gpxsee.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <dce94458-c9bc-4762-902c-7094d9bdc3c8@gpxsee.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026957:EE_|CH3PR12MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b4fcd27-7cfd-4e64-331b-08df4a547542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|10067099003|261102123227099003|261021121427099003|5023799004|11063799006|56012099006|4143699003|261022075727099003|261009223027099003|261026121527099003|261021123027099003|261022105027099003|261026140227099003|261102124227099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	zjlCLICwXU079ICVfYYKrVj+eDK8bAu5eJcHMzF0qFC9iX1ntho2fdD8GywVW/b7kM6XD0/RPuNbHpvapu8CY2vbFT/EHGpft4rxUdHrgiwC+3dSN6/QrzsA7EaQi0pkIMD8zWuZHHF14eGgHR7OH3usfDVhkol80w6r+udtwIhsScZoFWI42blJh+QrOo1LejakGhcTyjAaKdcPcbx2Svh91m/ctqLKlIXA9bCx1uTs3bK/hGjjiC2uBqMm6qQxtzBwxv9yWr5OnsCSkgd9HApApWiOddW8FmS+UE0KKXGKYvaIFXDN0VK9xjgQ3rIDpVCETrSGqq3Rj+3zmp/PuowHGn6uCLiW6HuRhXd0TzSVA3uybNBMKxu66pnGO33Etc2PAa+Ca+cd/JSFkNSOhoX9vcscGEVVVriK8BDkoB45aXISa+uIq+GqCN9FR4FgttJ+51t/Bhizh4mXlqIMFkfzJbpeJOO90UlPOAXq66iS24fa8jwU9l1E3Dlt3d+nWU1yYTGXRTAk4BnZIpOode+2zMwEcvi3BTsgdzkQs+buliDpvqI4OxRDexqVpKhJ06acFB1nwkFK0PPNFlI9vYX2ymvvkQUl6/0vz1KjSsDZVAN6StHE0WUgmNPdmrlrjgoI7EN+jZkN1IaL0mMhGgNBK1wt32mm35z7ivn2+snO/a96Swmze30AwzFRSTJF/ldz8+aS4tkX1t3hzpXJZQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(10067099003)(261102123227099003)(261021121427099003)(5023799004)(11063799006)(56012099006)(4143699003)(261022075727099003)(261009223027099003)(261026121527099003)(261021123027099003)(261022105027099003)(261026140227099003)(261102124227099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pcl5ROfzlY/2akW1hflZP3gw8+9mJ8fUK/J2HPcbC03lBMtLw+drYYYbASrUXMNqF1mbONwcX6/8iYrCw/5AkFSQwpjBvdXpZc/4Tcld/z8bFRodElKOcmesV5jTFGN6A8OXXqM89S6flZcPbbm6HARLEFq/sPrqHbiT2ZQs6d4SOBf6nKlDbWClEA9o1RJ8+nLedtYYgvUVoJyOiFoILlbKCpzcolWmR7NsgG224otFUh+XWpG5aFkdKuECXL4mTvZfKbxZlWQLr4WqrG0M3QefIOYch9HPaavXl2OXhKdhwDIxj6lDDOWQHwaz/IEdA+luK+m+MbhAml0O2sAaCxTR/+3vAyAKMiHlEQwFIq/BgF1NNrKkHQspHroJbKXd9ukYAMIgxTBmTT3ep6drgalaqav2jR9wpp4uW42VVVg8GCzH2EOGFpGO5efRGl6q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:57:51.3477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4fcd27-7cfd-4e64-331b-08df4a547542
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026957.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8726


On 11/24/26 02:35, Martin Tůma wrote:
> On 11/23/26 8:00 PM, Lizhi Hou wrote:
>>
>> On 11/20/26 14:21, Martin Tůma wrote:
>>>
>>>
>>> On 11/20/26 22:40, Lizhi Hou wrote:
>>>>
>>>> On 11/20/26 09:23, tumic@gpxsee.org wrote:
>>>>> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>>>>
>>>>> Add the missing PM suspend/resume callbacks that properly reconfigure
>>>>> the XDMA HW on PCIe suspend/resume.
>>>>
>>>> Just wondering if we could destroy xdma platform device in your 
>>>> PCIe suspend routine and re-create xdna device in PCIe resume?
>>>>
>>>
>>> While this may also be theoretically possible, there are several 
>>> arguments against this:
>>>
>>> - Every driver using the device would have to do it instead of doing 
>>> nothing and rely on the already established infrastructure for PM in 
>>> the kernel. 
>>
>> I am not sure if all xdma users would expect the same suspend and 
>> resume happening automatically.
>>
>
> Why wouldn't they? This is the standard Linux PM model that the driver 
> is responsible for the device to be fully operational after resume 
> like it was before suspend.

There is sound card case which uses cyclic dma. In this case, it might 
need to restart the data transfer after resume.

Also I did not see you stop the inflight DMA in the suspend callback? 
Would that work on other devices?

>
>> How about adding device_pause() and device_resume() callbacks to xdma 
>> driver and use dmaengine_pause() and dmaengine_resume() in your pci 
>> driver?
>>
>
> This seems like a crazy workaround for something for which there 
> already is a standard kernel mechanism that works fine. No one will 
> like to implement some obscure special handling for xdma devices to 
> make a standard case (PM suspend/resume) work. Especially when there 
> is no real reason to do that as the standard method works fine 
> (tested) for XDMA as well.

Just provide options to minimize the risk and unblock your work. Are you 
confident to have the common suspend/resume to handle all the cases? :)


Lizhi

>
> M.
>
>>
>> Thanks
>>
>> Lizhi
>>
>>> And it is not a simple "one function call" which would be needed
>>> (and duplicated in every driver), there is some additional re- 
>>> configuration needed, eg. the user IRQs.
>>> - The creation/destroying of platform devices does a lot more stuff 
>>> than just initializing some registers. It fiddles with the IRQ and 
>>> memory allocation/deallocation which you don't want or even can't do 
>>> while the system is in a PM suspend or PM resume state.
>>>
>>> M.
>>>
>>>> Lizhi
>>>>
>>>>>
>>>>> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>>>> ---
>>>>>   drivers/dma/xilinx/xdma.c | 147 +++++++++++++++++++++++++++++++ 
>>>>> +------
>>>>>   1 file changed, 124 insertions(+), 23 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
>>>>> index 9d827c9a1267..d6772b38d8f7 100644
>>>>> --- a/drivers/dma/xilinx/xdma.c
>>>>> +++ b/drivers/dma/xilinx/xdma.c
>>>>> @@ -123,6 +123,7 @@ struct xdma_desc {
>>>>>    * @irq_start: Start IRQ assigned to device
>>>>>    * @irq_num: Number of IRQ assigned to device
>>>>>    * @status: Initialization status
>>>>> + * @usr_irq_mask: User IRQ mask for PM suspend/resume
>>>>>    */
>>>>>   struct xdma_device {
>>>>>       struct platform_device    *pdev;
>>>>> @@ -135,6 +136,7 @@ struct xdma_device {
>>>>>       u32            irq_start;
>>>>>       u32            irq_num;
>>>>>       u32            status;
>>>>> +    u32            usr_irq_mask;
>>>>>   };
>>>>>   #define xdma_err(xdev, fmt, args...) \
>>>>> @@ -398,6 +400,27 @@ static int xdma_xfer_stop(struct xdma_chan 
>>>>> *xchan)
>>>>>                   CHAN_CTRL_RUN_STOP);
>>>>>   }
>>>>> +/**
>>>>> + * xdma_reconfig_channels - Reconfigure DMA channels
>>>>> + * @xdev: DMA device pointer
>>>>> + * @chans: channels configuration
>>>>> + * @chan_num: number of channels
>>>>> + */
>>>>> +static int xdma_reconfig_channels(struct xdma_chan *chans,
>>>>> +                  u32 chan_num)
>>>>> +{
>>>>> +    int i, ret;
>>>>> +
>>>>> +    for (i = 0; i < chan_num; i++) {
>>>>> +        /* init channel hardware */
>>>>> +        ret = xdma_channel_init(&(chans[i]));
>>>>> +        if (ret)
>>>>> +            return ret;
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>   /**
>>>>>    * xdma_alloc_channels - Detect and allocate DMA channels
>>>>>    * @xdev: DMA device pointer
>>>>> @@ -1018,6 +1041,55 @@ static int xdma_set_vector_reg(struct 
>>>>> xdma_device *xdev, u32 vec_tbl_start,
>>>>>       return 0;
>>>>>   }
>>>>> +/**
>>>>> + * xdma_irq_config - Configure IRQs
>>>>> + * @xdev: DMA device pointer
>>>>> + */
>>>>> +static int xdma_irq_config(struct xdma_device *xdev)
>>>>> +{
>>>>> +    u32 user_irq_start;
>>>>> +    int ret;
>>>>> +
>>>>> +    /* configure hardware IRQ registers */
>>>>> +    ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
>>>>> +                  XDMA_CHAN_NUM(xdev));
>>>>> +    if (ret) {
>>>>> +        xdma_err(xdev, "failed to set channel vectors: %d", ret);
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    /* configure user IRQ registers if needed */
>>>>> +    user_irq_start = XDMA_CHAN_NUM(xdev);
>>>>> +    if (xdev->irq_num > user_irq_start) {
>>>>> +        ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
>>>>> +                      user_irq_start,
>>>>> +                      xdev->irq_num - user_irq_start);
>>>>> +        if (ret) {
>>>>> +            xdma_err(xdev, "failed to set user vectors: %d", ret);
>>>>> +            return ret;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    /* enable channels interrupts */
>>>>> +    ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
>>>>> +    if (ret) {
>>>>> +        xdma_err(xdev, "failed to enable channel IRQs: %d", ret);
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    /* enable user interrupts if needed */
>>>>> +    if (xdev->irq_num > user_irq_start) {
>>>>> +        ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
>>>>> +                   xdev->usr_irq_mask);
>>>>> +        if (ret) {
>>>>> +            xdma_err(xdev, "failed to enable user IRQs: %d", ret);
>>>>> +            return ret;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>   /**
>>>>>    * xdma_irq_init - initialize IRQs
>>>>>    * @xdev: DMA device pointer
>>>>> @@ -1025,7 +1097,6 @@ static int xdma_set_vector_reg(struct 
>>>>> xdma_device *xdev, u32 vec_tbl_start,
>>>>>   static int xdma_irq_init(struct xdma_device *xdev)
>>>>>   {
>>>>>       u32 irq = xdev->irq_start;
>>>>> -    u32 user_irq_start;
>>>>>       int i, j, ret;
>>>>>       /* return failure if there are not enough IRQs */
>>>>> @@ -1060,28 +1131,8 @@ static int xdma_irq_init(struct xdma_device 
>>>>> *xdev)
>>>>>           irq++;
>>>>>       }
>>>>> -    /* config hardware IRQ registers */
>>>>> -    ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
>>>>> -                  XDMA_CHAN_NUM(xdev));
>>>>> -    if (ret) {
>>>>> -        xdma_err(xdev, "failed to set channel vectors: %d", ret);
>>>>> -        goto failed_init_c2h;
>>>>> -    }
>>>>> -
>>>>> -    /* config user IRQ registers if needed */
>>>>> -    user_irq_start = XDMA_CHAN_NUM(xdev);
>>>>> -    if (xdev->irq_num > user_irq_start) {
>>>>> -        ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
>>>>> -                      user_irq_start,
>>>>> -                      xdev->irq_num - user_irq_start);
>>>>> -        if (ret) {
>>>>> -            xdma_err(xdev, "failed to set user vectors: %d", ret);
>>>>> -            goto failed_init_c2h;
>>>>> -        }
>>>>> -    }
>>>>> -
>>>>> -    /* enable interrupt */
>>>>> -    ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
>>>>> +    /* configure all HW IRQ registers */
>>>>> +    ret = xdma_irq_config(xdev);
>>>>>       if (ret)
>>>>>           goto failed_init_c2h;
>>>>> @@ -1297,15 +1348,65 @@ static int xdma_probe(struct 
>>>>> platform_device *pdev)
>>>>>       return ret;
>>>>>   }
>>>>> +/**
>>>>> + * xdma_suspend - PM suspend callback
>>>>> + * @dev: XDMA device pointer
>>>>> + */
>>>>> +static int xdma_suspend(struct device *dev)
>>>>> +{
>>>>> +    struct xdma_device *xdev = dev_get_drvdata(dev);
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = regmap_read(xdev->rmap, XDMA_IRQ_USER_INT_EN,
>>>>> +              &xdev->usr_irq_mask);
>>>>> +    if (ret) {
>>>>> +        xdma_err(xdev, "User IRQ vector backup failed: %d", ret);
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
>>>>> +    if (ret)
>>>>> +        xdma_err(xdev, "DMA channels IRQ disable failed: %d", ret);
>>>>> +
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * xdma_resume - PM resume callback
>>>>> + * @dev: XDMA device pointer
>>>>> + */
>>>>> +static int xdma_resume(struct device *dev)
>>>>> +{
>>>>> +    struct xdma_device *xdev = dev_get_drvdata(dev);
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = xdma_reconfig_channels(xdev->h2c_chans, 
>>>>> xdev->h2c_chan_num);
>>>>> +    if (ret) {
>>>>> +        xdma_err(xdev, "H2C channels reconfiguration failed: %d", 
>>>>> ret);
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    ret = xdma_reconfig_channels(xdev->c2h_chans, 
>>>>> xdev->c2h_chan_num);
>>>>> +    if (ret) {
>>>>> +        xdma_err(xdev, "C2H channels reconfiguration failed: %d", 
>>>>> ret);
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    return xdma_irq_config(xdev);
>>>>> +}
>>>>> +
>>>>>   static const struct platform_device_id xdma_id_table[] = {
>>>>>       { "xdma", 0},
>>>>>       { },
>>>>>   };
>>>>>   MODULE_DEVICE_TABLE(platform, xdma_id_table);
>>>>> +static DEFINE_NOIRQ_DEV_PM_OPS(xdma_dev_pm_ops, xdma_suspend, 
>>>>> xdma_resume);
>>>>> +
>>>>>   static struct platform_driver xdma_driver = {
>>>>>       .driver        = {
>>>>>           .name = "xdma",
>>>>> +        .pm = pm_sleep_ptr(&xdma_dev_pm_ops),
>>>>>       },
>>>>>       .id_table    = xdma_id_table,
>>>>>       .probe        = xdma_probe,
>>>>
>>>
>>
>
