Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183274;
	b=rRJBupyl/yh70OzMlgZV18omYLRzpJ/v8qzVZEuJ6jMFg4TUknDln3y1yd39N8+0z6MS
	 VKsz8kJh1HcmwIM8+DGZOuCE1WFnm7hi2RLuom/c8WWAHKJmPve8KYpeZy4wcn4b4Q1hJ
	 y1g2ph+JrGUl1Y9LqGM/Ao3Xl/JisEDqoo7Df+HWpIqNHzv7n6go702uj+mjCDzepqG5J
	 8JRK7TmN98xDe5ehntuE4lSynXQFsS3N7o7o9+HXJvfXr1Ssj7hL8YDO749DCXXvhGT4B
	 efG0LJMBXXjSUUlVSxXKwQBzGB0y+8zeK/bHNaTmlQIbR1dGellRbt3oNf2O0ckWyfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PKbaPQsHHOhvacrmvvpMN5t1cCuxJyoRdKRaZq+8jRY=;
	b=oTZwnNfHbifrqStSTKX2S5XdOtc/yqctUJMkIEmkjrtMfLrYDJr2eTxoNKEMClNlF/Rb
	 kebBY3YJR0Hqbyj3QGIyXyqwow3Tv8EOOOPfm40mHazTUWdvUWOCQ/csaaYl3CiLF/0so
	 NFw+/jtdJlfTO0Sq+2hLf9XeZmoGh0cK/oSEMFRR6dZ7mcz40w31sRKZ4vHQLIl7jREVC
	 boHNy5B0X7ancURAL94s7ZdbiKE5LYvm+h/IGwbMmmo28RuHDjiO1ckiijUjxNtzzals+
	 YLlGH+Gvfou3znXP57ZNObX14qAAuoLhEHOwGtwxs+AIyRznHzFILyWZAdbczme8pEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWSuo7o1;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE52B606A31C
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 00:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE52B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWSuo7o1
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so193156b3a.0
        for <dmaengine@vger.kernel.org>; Sun, 08 Nov 2026 16:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794183273; x=1794788073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKbaPQsHHOhvacrmvvpMN5t1cCuxJyoRdKRaZq+8jRY=;
        b=ZWSuo7o1a8UnAu8ncnh5mn3fSiYXc6RaBhlIVj34wIGCkP5oIgEI3ZIhR1PPCStR99
         es4VkceP4A/YQn5zgOskoYrNJsBpiioGXm3dcDwHrc8p0VGbjsVLtf3jpirm4WdIHvyo
         sfNsyrKFGOVtf3DpRkI6+42XEXYU3fPJOpGpRxgKiZsKwZhZe+DhMXYaEjvOE2B1uIef
         L9Z6YW+NrmHGtXWy9t7wPwht+DC66M6tPa8JwfVAfUPQ1K3aT8E0L2RedPDVvIOz+JCS
         igIyLiHooDBiJvvx/F62nscNzDw0Ur+9CODjcwXv/BkqGwA+wl8dx6yOae32sk1bvulp
         nZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183273; x=1794788073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKbaPQsHHOhvacrmvvpMN5t1cCuxJyoRdKRaZq+8jRY=;
        b=nn9GrL4JXhVzAm9vS/oNXYX4wYzsNITHE3o72gMre7QLNQBox6RLqwpBNOquSQCV94
         jOE1c8Ljo0ChB57szX07eQyFsrEgtB+lhVWl/KBX4TVUsO2ADh8H3qk55CklpeABhGfv
         32ZHSgcoiiZFUVvlJBJJaPewik1P405r3FjzxgZfdr9URD/u7ApZEo3acXX5WglVD3Xf
         1LPiGKHjOY6YhtngYKEVQ3ftqtKiCQBQcFz52j3Q25uD+9AcVeY8u1lb9X3Xhf3IP2Tb
         MXEd4vcQjFSnFxyNTxHPOM+X0pFQtJ0+oMrJ5SGcmDML/09JGea5Kw3rhGuS2GX1nvF1
         AQ/A==
X-Forwarded-Encrypted: i=1; AL+hErGhh9icYpK6S+j3SK/k5rQMDBYZKRHAonz8wR7ALpyAZr5JfVumQ/Kf3Kqxyz9B73q337/5HklOms8=@vger.kernel.org
X-Gm-Message-State: APuU4Z86c2MRoZEytLN+TtQdzX2RviTXoPbKmQl15uBV+USPb/txQ8Je
	N6MiVg7g+mjlNRuZKaYg9mEdZ7Lfc67JafVLVdNIsRQY/wI7FO4v23LH
X-Gm-Gg: AYBFou3kkwxsYT6OeUK7hsZSol0+vpSluoJ/g8joYoLTLQYMS0dLgYduMKS8RHoPuoR
	XuD/W3J5TFGb/R3yVQ4klfgrSJp0WYGaTPVeqDkPWqrEuQi7YvPLxrfaUYZj6aYJo7eN9B7WQTI
	UyF2UWy7RuM7e06i+ZSHH27kohuVp3kMCgFOd1wU1IPmP+DxfFuX3tsMVW4sgVL75Cdq1ghPCN3
	+LWIo/5a6kcTOfNRceA36lEaXPMg2BDlZyMP/DsLficIxVcKA1Y+knawskotGcLmr6csJd+op1s
	QgemGtv+phmkYrP/96XiQG0Ox9xIUzfJQWwvYYSSlMPNTVnpOkRwA8WAZiH8x21KE7zr6im96U0
	uMs32OiIxVCicX2WDFLYCGwXRe3N9oGsXej1XUoXJVeGpd+8MWZemI0gCZzyiNFMqeGPoXoWYRl
	J6qFzOSGXXTEJlHw/6zrB+slvsavvXa660J+NzsR+x9mwS9JW3rLeIjdRph8Uyky1lwF3apM5vP
	27oFPorgZmI+G6MOenGh5zSrd/d2gyL4Ij5CzYeEKx+VhiAIAWL4eaIqFj35JqkvGKnuB+Vwu8I
	XmtHFzbr+Q8TIhpreq31IcpCDa+yDlaP/IR5AFt4A4WeH0xcFgYPUOoTk7GS1vWfmejAOeNYJvE
	mMlQ=
X-Received: by 2002:a05:6a00:9a3:b0:897:ffff:c18a with SMTP id d2e1a72fcca58-8b66c3a7923mr2227291b3a.7.1794183272958;
        Sun, 08 Nov 2026 16:14:32 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b649821abesm777951b3a.34.2026.11.08.16.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 16:14:32 -0800 (PST)
Message-ID: <faa957ac-badf-4027-b86b-e12b8dd4bc7e@gmail.com>
Date: Mon, 9 Nov 2026 08:14:16 +0800
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
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-3-shanchun1218@gmail.com>
 <au4GkvPTXmcvReoj@monoceros>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <au4GkvPTXmcvReoj@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Uwe,

Thanks for your review.

On 11/7/2026 12:57 AM, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Nov 03, 2026 at 10:22:02AM +0800, Shan-Chun Hung wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/platform_device.h>
> 
> Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
> good enough to provide of_device_id already. If you insist on full iwyu,
> please use <linux/device-id/of.h> instead.
I will remove it.
> 
> Best regards
> Uwe

Best Regards,
Shan-Chun
