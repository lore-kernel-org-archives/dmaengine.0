Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560818;
	b=JgkIq9HZQsyYGF/7LjdTCmYDz65UfhBXaNFIg/JgM43fefUH9UJxipzB5e/XnHUUchLB
	 0WRXsjzsegSOIt4uuob6bcmE4C5iIy5NA2F1ttug258EbiQX/ShpqmGRl2HTxUzKdEItg
	 LaTRLLVOWNmgIpfHsu7WeJZy809kBOBYCSmXsWPT6pSngVGfKJNlLvGJtigciAMtvsCw0
	 iVgwPpD10QC7KnL2go4b3LzEzJO1NA5OPPnAlY4rZ2pug2ZM7YK9HtrMSy8VcsENMiZsE
	 6bnxOnV6yeKHAaeMCaJxFlTK2ywAQSr8Y01I+EMXWnjOPsSadD3AX3yPv3aLFVMJgUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560818;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-SA-Exim-Connect-IP:
	 X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:Subject:X-SA-Exim-Version:
	 X-SA-Exim-Scanned;
	bh=fB5eaI7Qj03swRVIu80Gf5lTHFrkJ1sj/Fsup7aCYW0=;
	b=h64ZHeCBR+hQZSnLetfdz/trLfDvQEqadoXXLV+h0F213SoKypPL7OexOAAOMXxdSPyh
	 5714xMmruU6OLhjQfDJ/d2aVJyZcW6fv20o+gJbJWMhSMxlvQDdEQATr0ZeRx1STlg5uQ
	 GXilUpc2o4yx9yqe+DRd98jEJSPrKUlSp+ZxCaHtrymK08LvBX1GhRZCLQ+QBXyisb2BB
	 wCk+gObfSHt0vux7Pj8eOKW5kRd+0vG5C8nUoJkjUWInD8EDDoZgEJFHA9swsjkMex52A
	 5HNjIamegTmbyRmiCa/oWhCT/JvrqbQoqGaeodQvIf9kEZQGNFbZJSNiU5bAEe6hlkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=nTSf7usl;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27331606A323;
	Tue, 24 Nov 2026 22:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27331606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=nTSf7usl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=fB5eaI7Qj03swRVIu80Gf5lTHFrkJ1sj/Fsup7aCYW0=; b=nTSf7uslDvKlzQoEa/YhX7GO3N
	Cel4BQu4UoaEZAKY1fud43sCAMPJ7RYFccBzs7IML5e0+9iL5p9lLL1qjEksuu2sj5dwICJUIFmzy
	/XcA/ZlMIpPHsRfuCAFJ6Fl9Uj6YMlni7Tij8Tks8THAtE2Benszs4v5FvyAtwW6sYMEOTVM1TQ6j
	0u0V85kgVt/7y+MQ744rmdhO2771ucedCAYEnquYv+RyLaDJt/TAvDL3J1/y18q4V/dc9Pnt7o7M7
	6CGrIn/+BTJ1c2sIUJaRCKMXWs1TSLFMCnEpk+QT81ZQjScSXr2lCljdDgjhhkpg+tbCLMgYzto/3
	JzgSEdAQ==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xVzOK-00000000rPr-1tgg;
	Tue, 24 Nov 2026 16:53:37 -0600
Message-ID: <9f243227-c668-4980-8cd2-8c7e45940cf6@deltatee.com>
Date: Tue, 24 Nov 2026 16:53:30 -0600
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
References: <20261124155024.920403-1-logang@deltatee.com>
 <20261124155024.920403-5-logang@deltatee.com>
 <sashiko-outbox-231501@kernel.org>
 <awXfpjkv0MBDvYyK@lizhi-Precision-Tower-5810>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <awXfpjkv0MBDvYyK@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: Frank.li@oss.nxp.com, sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH v5 4/4] dmaengine: switchtec-dma: add pmon sysfs
 attributes
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2026-11-24 13:04, Frank Li wrote:
> On Tue, Nov 24, 2026 at 03:59:03PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue to consider:
>> - [Low] dmaengine: switchtec-dma: multi-line menu output in
>>   latency_selector_show()
>> --
>>
>> commit 88f647b9334dbbed040eb8ea50d2882f9874a0c9
>> Author: Logan Gunthorpe <logang@deltatee.com>
>>
>> dmaengine: switchtec-dma: add pmon sysfs attributes
>>
>> This commit adds a "switchtec-pmon" sysfs attribute group to expose
>> Switchtec DMA performance monitor registers per channel.
>>
>>> diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
>>> index 1ebe17095c61a..774b418330ed7 100644
>>> --- a/drivers/dma/switchtec_dma.c
>>> +++ b/drivers/dma/switchtec_dma.c
>> [ ... ]
>>> @@ -1215,8 +1222,274 @@ static const struct attribute_group switchtec_config_group = {
>>>  	.attrs = switchtec_config_attrs,
>>>  };
>> [ ... ]
>>> +static ssize_t latency_selector_show(struct device *dev,
>>> +				     struct device_attribute *attr, char *page)
>>> +{
>> [ ... ]
>>> +	len = sysfs_emit(page,
>>> +			 "To select a latency type, write the type number\n");
>>> +	len += sysfs_emit_at(page, len, "(1 ~ 5) to latency_selector\n\n");
>>> +
>>> +	len += sysfs_emit_at(page, len, "Latency Types:\n");
>>> +	len += sysfs_emit_at(page, len, "(1) SE Fetch latency");
>>> +	if (lat & SWITCHTEC_LAT_SE_FETCH)
>>> +		len += sysfs_emit_at(page, len, " (*)\n");
>>> +	else
>>> +		len += sysfs_emit_at(page, len, "\n");
>>> +
>>> +	len += sysfs_emit_at(page, len, "(2) VDM latency");
>>> +	if (lat & SWITCHTEC_LAT_VDM)
>>> +		len += sysfs_emit_at(page, len, " (*)\n");
>>> +	else
>>> +		len += sysfs_emit_at(page, len, "\n");
>>> +
>>> +	len += sysfs_emit_at(page, len, "(3) Read Immediate latency");
>>> +	if (lat & SWITCHTEC_LAT_RD_IMM)
>>> +		len += sysfs_emit_at(page, len, " (*)\n");
>>> +	else
>>> +		len += sysfs_emit_at(page, len, "\n");
>>> +
>>> +	len += sysfs_emit_at(page, len, "(4) SE Processing latency");
>>> +	if (lat & SWITCHTEC_LAT_SE_PROCESS)
>>> +		len += sysfs_emit_at(page, len, " (*)\n");
>>> +	else
>>> +		len += sysfs_emit_at(page, len, "\n");
>>> +
>>> +	len += sysfs_emit_at(page, len, "(5) FW NP TLP latency");
>>> +	if (lat & SWITCHTEC_LAT_FW_NP)
>>> +		len += sysfs_emit_at(page, len, " (*)\n");
>>> +	else
>>> +		len += sysfs_emit_at(page, len, "\n");
>>> +
>>> +	return len;
>>> +}
>>> +
>>> +static ssize_t latency_selector_store(struct device *dev,
>>> +				      struct device_attribute *attr,
>>> +				      const char *page, size_t count)
>>> +{
>> [ ... ]
>>> +	if (kstrtoint(page, 0, &lat_type) < 0)
>>> +		return -EINVAL;
>>
>> [Severity: Low]
>> Does latency_selector_show() violate the sysfs one-value-per-file rule in
>> Documentation/filesystems/sysfs.rst?
>>
>> Reading latency_selector emits multi-line usage instructions and a
>> numbered menu marking the active bit with "(*)", whereas
>> latency_selector_store() parses a single integer from 1 to 5 via
>> kstrtoint(), so the attribute's output cannot be parsed as a single value
>> or written back to the file.  Could latency_selector expose a single value
>> (or a single-line space-separated list of tokens with brackets around the
>> active selection, documented under Documentation/ABI/), or move the
>> human-formatted menu to debugfs?
> 
> Yes, this is one problem, which need be addressed.
> the sysfs one-value-per-file rule
I responded to this in v4[1].

We were really hoping to skirt that rule seeing we view the self
documenting feature of the field worth having. If you really want to
push this issue please let us know so we can create a new version
promptly. I'd really like to get this merged this cycle.

Thanks,

Logan


[1]
https://lore.kernel.org/all/dbe72187-4c12-4a8f-a63f-0c4238e50ec5@deltatee.com/
