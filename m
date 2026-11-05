Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793850005;
	b=PHLGbDP/M/CZvT+ISd0dHoXvDvgObD8z6KzOF2ACUmR3GIT3CmGhquy5AYG65ti8eqo4
	 59YnPaWIzg74ygUQ2mJ0s2whWzzVAYWbeQ01dDUtUJoi9AZiGPhNbFdsGEOkpvEj81ZVv
	 G+prPmQ7ptL+tlbvPoYqB3qzKOpOb2WMtdH0jdVu9wDL72ra740iQHFSM5OjVYE4NSB7+
	 GoqdKXg0uA4QpccT+Wr6vUGidRu2lnzfdXx59/21rKmzY/Ht4ZDhrFvZTlorBPhQenMQ0
	 62B9GJ0BzsKt8as5b22TUVeaPtKNNf9WrU9CcVZU1S6AhinY6WVNdmWjDpC6JGGGjVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5LUE2uGbYietmUvUa8zlMC5H0i4xuvRsDA3cqPloBd4=;
	b=S/BKPYmJh0nWzXQQ3UfEN8Ul1E6kkGjWupFzYFjzVal3H24DC6hdQxrn8pXlGO2FwFDj
	 WWkiZjncNAqctC4/xJ7Ajyu3r/MwoBKo4rjTkajvwre99nLHLLuLkAnDNcA288xLjBjg0
	 3krTOuri0HB8OBxkGZ+luQ96vWky53d/XLHGiaLfnSIiM6hRWtkwG22FYw2AszNJLgigL
	 rt0cOdetCZosEET3sz3Ivoz8eNK2rZj7W6QabNyLLhzn51iLuQP++FElq/gkpOoijqvcT
	 szLKtV3WeDb4InQG4mKVVcS7WCbSW2kV1FJVUajktCIxLx4AiLdBnBwwc26mTaVU2gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nfy9GBV6;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385ED606A329
	for <dmaengine@vger.kernel.org>; Thu,  5 Nov 2026 03:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 385ED606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nfy9GBV6
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so948656a91.1
        for <dmaengine@vger.kernel.org>; Wed, 04 Nov 2026 19:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793850004; x=1794454804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LUE2uGbYietmUvUa8zlMC5H0i4xuvRsDA3cqPloBd4=;
        b=nfy9GBV63yiJ2Z+IKluc2xaqj299WNN6uE3JJsLL6mh6GKCY2XjSBdABb6pMaeH8yP
         NSUmoUKJaRlNc6OVrXXXD4EDOemIj7/cvRFjBIwYFr4FtxlJc5+Lt1+SoY24XuTooEsK
         CRE+K7TYq1aljhw8+BtXhGFL+mjGQniEFuEL+3TbyEKTFFgrkpIrsJ7S31yMAarSCF8P
         lEF3LCW3rhjMkRB6AYUC4J7xYDNOIG4wL3NHu0+6sloFEdFu2eTqqBVNRedFvyz55CZw
         sErBKEplmFpy4fh5MyD53AuwdulAgML5Xlva/SiaY9eXzZtDi4Pjvr/rGaV1PBSqtbnL
         aZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793850004; x=1794454804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LUE2uGbYietmUvUa8zlMC5H0i4xuvRsDA3cqPloBd4=;
        b=bvtS+gmq8M5dMm03XzbeX7UhkvED1hweOXiNvzFQmqTE4NoxC6QZE7E7tRGBGedTPP
         CMox4uuhcOjy8FCW9AwUGWcEcBRybuTFNYU8pu3ChK8cxFWOyqEwJ5jmvqodOb6a5Wrv
         mpuYFOjyThS2H1erXLNuHZnB7Sg9IzR/e6SpcFxTIS2IVHDzTPNTWreMiCf4/6YBos0y
         uRGLu5zkWSJNyefasALU1oHB57o6UeHB3MuAVk3OfgIPGoZhlGTC5rVJWqROicmk8Rf6
         0DxZZWdcjpsjZAtWoSfpJRlz1Uejl9b3f/KPSTKWwKFwdCxQ38ZbUtrRnf2CbYT7akum
         VzEA==
X-Gm-Message-State: APuU4Z8nGq2MLjtC8yhu+CKv1mvqtF/A0fHo3cQ331o/1xOz98jLBkZM
	WOW/R+1eAxTop+ISivfvDkR+N3n/a228B3SGZPpkU8F/v3q4Xjf+rsyEQ1WEjw==
X-Gm-Gg: AYBFou05u4AdGpWvNRpLsWYDilJWFjzBLjCdRs3zcP0ApeSZj6/Q1X5aaA3QegPjpW/
	x4Ebu58K0QVlXW5rCEehmjQEUwap59TuQGayRRw1B8mY0Ot0WXuMyfjple8+uloc7bietlQ7ucq
	meWdn8+AmDo8LLDNCBmEOzqAbWVc0WYyYvPbZe7XXDstmweoJGLXN8NwZNF9QTaZnhECncjtQwi
	9uumosS7MQaiWxLozLl3EMxIRW9cjs+BkSXE8ecKx9KwWA7mv2FZ6vEWYCRY3o/ILV09arbDjwR
	dY7aNa+qDGZIS5HdBM+rlEmMZg7kBaLxbxDmOeUCBjSbUW64bpT+9xyHNj1L1RROVmU6rrovGKy
	YK+zUhJWaYH1SUUP35qWMSF2bD8loowH/YqTTsQOH9pyT39cQ15icvFXW0+me9xDd9U4a4OacjU
	Fb/4Ya07+zRHkK8IbruvSrmnm5Mf+YgE76RU/AbU5QCyfo+nTcBUyfglpDXB/ddAJgkZ8FmYxZg
	fXb4qmFr9tbNiO5KRT44YFEuWC1VtxLlRY7oHxb4iAMKnTV0y6+XNMxT+gZG++5927/SiTSM9cF
	yCPT/eeGjAAVDBNnwokYlFoLn76GqN7VKnBZ90LUCES8rEJpNber2wZgiXsVrNWAi6hC43l2ObP
	Yz1s=
X-Received: by 2002:a17:90b:1a88:b0:3ae:3f20:7056 with SMTP id 98e67ed59e1d1-3ae89746c9cmr16276951a91.31.1793850004529;
        Wed, 04 Nov 2026 19:40:04 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3265a52sm1382575a91.10.2026.11.04.19.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 19:40:03 -0800 (PST)
Message-ID: <fcbd337e-71e4-4b34-b1db-800390a61ffb@gmail.com>
Date: Thu, 5 Nov 2026 11:39:51 +0800
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
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-3-shanchun1218@gmail.com>
 <sashiko-outbox-194466@kernel.org> <auuHy9_GAzYZL9V5@SMW015318>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <auuHy9_GAzYZL9V5@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Frank,

Thanks for the feedback. I will address these issues in the next revision.

Best regards,
Shan-Chun

On 11/5/2026 3:30 AM, Frank Li wrote:
> On Tue, Nov 03, 2026 at 02:43:08AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 11 potential issue(s) to consider:
>> - [Critical] dmaengine: ma35d1: premature register setup in ma35d1_desc_alloc() and prep
>> - [Critical] dmaengine: ma35d1: active DMA after timeout and double completion in IRQ
>> - [High] dmaengine: ma35d1: missing PDMA_TBINTDIS in ma35d1_prep_dma_memcpy()
>> - [High] dmaengine: ma35d1: unvalidated SG segment lengths in ma35d1_prep_slave_sg()
>> - [High] dmaengine: ma35d1: broken residue and status reporting in ma35d1_tx_status()
>> - [High] dmaengine: ma35d1: unlocked PDMA_TOUTEN RMW in ma35d1_pdma_interrupt()
>> - [High] dmaengine: ma35d1: state bugs in ma35d1_of_xlate() and free_chan_resources()
>> - [High] dmaengine: ma35d1-pdma: fix signed dma-channels pointer and zero bounds check
>> - [High] dmaengine: ma35d1-pdma: unsafe teardown order in ma35d1_pdma_remove()
>> - [Medium] dmaengine: ma35d1-pdma: disable channel timeout in ma35d1_terminate_all()
>> - [Medium] dmaengine: ma35d1-pdma: unreleased ch->desc and stale ch->cfg in ma35d1_free_chan_resources()
>> --
> 
> Please fix these issues.
> 
> Frank

