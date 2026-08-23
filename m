Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103102F1FED
	for <dmaengine@vger.kernel.org>; Sun, 23 Aug 2026 14:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787495827; cv=none; b=MvzN0hL5hh31W7ZHZ+jwAc7+2oWSm2AL8MinJ6cSRlAA4Azfbwm/RUcp3xV4rO9ISSQgN6RszElcMRcMWTyYrN4O910W72bEg18evoJ3h/sdk6z4PS5jtyNA3f9tYEwDv7YdATYtY/f2zugLzr6J5dpqu7lWn9jgWjGAGGpSJTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787495827; c=relaxed/simple;
	bh=qZZWn22YQl20SjyVdcx7nzk3Bsd1rFBGXKmPjvWGvSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBW9rpt59d3vyGeI9V8Ahu5EyE5/ynI/ivuCvugUkwDCMAzIDe1NPvz3RgZCYqtSFbjouXBmaiZ4fI82Buxr5E/lN6pawMoy6bN2YMJKfq7Hi1UX05soWyK5s6gyJwiQA2i2xuP4UIizx26VCn4B7ils3zZWrUr9CXBC9Hjp3fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GD++IGa9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GD++IGa9"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2355854f8f.1
        for <dmaengine@vger.kernel.org>; Sun, 23 Aug 2026 07:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787495824; x=1788100624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjVwgap47YOeIukz8yw67SDCadu22oFRx+M5RlZB4jk=;
        b=GD++IGa9pYcoFWRdE3RHolqCSG0lblSQw1MsJHHGf4BS3EcF4zSSsNaTKc6KSXwHZM
         nUSrVtHeadufgS9HBiGZhmZZFvu+d0u87acz4CYS+8Z26PBJl3vHwA+JauKDovU/XeVE
         44sSZbXozsFGkdRFZRy4RjKHjEUtb8D/JEGiySlQ6BcHP6re8caqVRbKrb71ixqSXBC3
         q2IO60fTDPQj/BsPAFtIy//qFF41N44vbPWUqZGB92IMENx+/ZD78M0A1hT/T9xjTtIX
         u+j4wJXMgWPd8Bgfq6JJ7BrpvqSq3zxHcxzunHRO/b5J28guxXxk9YWZprjTXPakzmQr
         Hfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787495824; x=1788100624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IjVwgap47YOeIukz8yw67SDCadu22oFRx+M5RlZB4jk=;
        b=l3YfgZoBgN9AA9pPNCIv+T3siPYkCJ5ikf6daq9IsAnST2BJVCicztVF8LI6oL/gLs
         OtbzeZNKgB97B4XcWweHmtouFLuGMCLN03AUvAg0QxXoc28gN5txYdyTg8jCY2fm6asL
         h9pbkMOHEaJzMVKg9MPgiovU+u/Oo7j3Wn2sgMQ1mOR6RG96Q5Z+SIT0Y85H26Xpn5Up
         Eg+4c6SU1v3f2t3rXd0ls402pN40tkJ8PTPuZjtFcdWetu4yETQ5C8naqJR1F+/E1cJl
         C5Xf7RIiTk/YRZaqfVxzrkMf9xlv/ncDFKoeoM/ChrgxUiBwSUmnnLV4tnpa0WDd7cpG
         kf5w==
X-Forwarded-Encrypted: i=1; AHgh+RqEZ+mi7kyNG0+V0JrXS78j2Pd86FUJcJWB+k/Fi5AYvg7NyLRyjyUzhT5pysf8cqME5XBV4+bz7sQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nzpBMfxJaRdwOym8IM8W8w4aaEtghaXDLP8EpSU2TnF5BmhnZi
	5uu0Rb9RLzV36WVgtFXNMiZsqTmGHDzSXsN7x+DlcYVAd0goJeFUGTTY
X-Gm-Gg: AR+sD10Gcp4oo2v32l81IK9BpfogF4UrOBfpmYDkTBdbRkMT9o1I41taP8HHMKWTRpb
	CPRt6sebNQRYpa9bsD6VN44/Ivx+Ddv5O3PTKRJGsm/VnUxFj1/elABx7LkFeVkM13nx8vF0AJl
	2QKl8bDjz8f7EF3X1Oi5iZLZRlxkos0Oi3tvlwxFyE3KlHG7ap8Q7hnIhqVpFXImwvF6T28eMWc
	fLdmXohaZYFSD17bTdlimPyyG1pJnVtLVwYxi5RwiQVbnBYxVdyJn6DiwLYGiloZV66U8c4gLj+
	8GIdMT1EBqU2vZZI/31Ew13GbBoPSG2vGSpYppw4RQITQPkhrnyaiTmXC12VyqUwGU4lPn/+3re
	k7WCAo3qxOqqa+FxL714mXnvTrD3ypjw8xf+tEHAck1fTdl0Q28y46OCP80R5h8en9hqz5d5lUD
	MRjXWBkfvF+qIjfAEkqJ1YVwXtk/JK3oMsSvXOjU4IaU6ovUJRV+eI0lJpyEa7/8Ul/j0upDp/g
	uvjf/yoQg0q8vypfnMHZvlt3g8T7JD7P7dtQPvyEKLJipKKlIP/iAk9HA==
X-Received: by 2002:a05:6000:46c2:b0:482:c650:8c89 with SMTP id ffacd0b85a97d-482c6508d4emr12735930f8f.9.1787495824002;
        Sun, 23 Aug 2026 07:37:04 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b69b3csm5404807f8f.3.2026.08.23.07.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 07:37:03 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <f66f3199-df76-4158-9ddd-23e9096a1fd4@gmail.com>
Date: Sun, 23 Aug 2026 15:37:01 +0100
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: remove dead 440SP code
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, Frank.Li@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Cc: linusw@kernel.org, kees@kernel.org, colin.i.king@gmail.com,
 rosenp@gmail.com, joao@joaoff.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20260816125615.985387-1-julianbraha@gmail.com>
 <c4d970dd-cb54-4530-9491-01b6d90e4a2b@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <c4d970dd-cb54-4530-9491-01b6d90e4a2b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Christophe,

On 8/17/26 07:29, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 16/08/2026 à 14:56, Julian Braha a écrit :
>> The 440SP config option can never be enabled, making all references to it
>> dead code.
>>
>> Let's remove support for 440SP, since nobody can be using it anyway.
>>
>> This dead code was found by kconfirm, a static analysis tool for Kconfig.
> 
> It would be good to include history in the commit description:
> 
> As far as I can see, users of CONFIG_440SP were commented out by commit
> f65573314e4e ("[POWERPC] Re-organize Kconfig code for 4xx in arch/
> powerpc") and removed by commit ff5f483f3091 ("powerpc: 4xx: remove
> commented out Kconfig entries")
> 
> 
>>
>> Signed-off-by: Julian Braha <julianbraha@gmail.com>
>> ---
>>   arch/powerpc/boot/cuboot-katmai.c   |  2 +-
>>   arch/powerpc/include/asm/async_tx.h |  2 +-
>>   arch/powerpc/include/asm/dcr-regs.h | 10 +++++-----
>>   arch/powerpc/kernel/cpu_specs_44x.h | 12 ------------
>>   arch/powerpc/platforms/44x/Kconfig  |  3 ---
>>   drivers/dma/Kconfig                 |  2 +-
>>   drivers/dma/ppc4xx/adma.c           |  9 ---------
>>   drivers/dma/ppc4xx/adma.h           |  2 +-
>>   drivers/dma/ppc4xx/dma.h            |  9 ---------
>>   drivers/net/ethernet/ibm/emac/mal.h |  2 +-
>>   10 files changed, 10 insertions(+), 43 deletions(-)
>>
>> diff --git a/arch/powerpc/boot/cuboot-katmai.c b/arch/powerpc/boot/
>> cuboot-katmai.c
>> index 034a748fde24..fcd71e76309f 100644
>> --- a/arch/powerpc/boot/cuboot-katmai.c
>> +++ b/arch/powerpc/boot/cuboot-katmai.c
>> @@ -31,7 +31,7 @@ static void katmai_fixups(void)
>>   {
>>       unsigned long sysclk = 33333000;
>>   -    /* 440SP Clock logic is all but identical to 440GX
>> +    /* 440SPe Clock logic is all but identical to 440GX
>>        * so we just use that code for now at least
>>        */
>>       ibm440spe_fixup_clocks(sysclk, 6 * 1843200, 0);
>> diff --git a/arch/powerpc/include/asm/async_tx.h b/arch/powerpc/
>> include/asm/async_tx.h
>> index a14758426dd5..1ff5b2ca3ed1 100644
>> --- a/arch/powerpc/include/asm/async_tx.h
>> +++ b/arch/powerpc/include/asm/async_tx.h
>> @@ -7,7 +7,7 @@
>>   #ifndef _ASM_POWERPC_ASYNC_TX_H_
>>   #define _ASM_POWERPC_ASYNC_TX_H_
>>   -#if defined(CONFIG_440SPe) || defined(CONFIG_440SP)
>> +#if defined(CONFIG_440SPe)
> 
> Replace by #ifdef CONFIG_440SPe

Thanks for your feedback, will send a v2!

- Julian Braha

