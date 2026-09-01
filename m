Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9835241A559
	for <dmaengine@vger.kernel.org>; Tue,  1 Sep 2026 15:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276794; cv=none; b=oxLLoe/nBDNewL9bTt+DSLwPzzMQrt3tABU7ejiIrExgVRbOlXy/tjVG56cN8RAJ7Rp54ZBASujRPuqQP4a0ZqgBaHaISh7GhOiQLm5P+szgDLeXKgL3ZNIft0wLrLespJj0BtwMI85bkY8iYXICuZz6RWX5DQOWEdwARIoNy3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276794; c=relaxed/simple;
	bh=o4eiiOgyTMR4oiOjJLwbIivX4xRoo+O/tllD/DUpr9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AKPQejEpwdwvlPK/8XpkiviwCjRO0AvbXFg751yWStnSf8qs6+YDOKIXV4Hx3eHfEpoVrvnyyfuzjBtP7SoXGxwYiZJuS2dZY0LFIcsPn232JCGJj6HgkBwF9jTnAzDaLMMOR4xVqX4qnd9WRvzdRM7GxOx6/LcMO5JOB1hNGDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTlkBGoU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTlkBGoU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so34401435e9.1
        for <dmaengine@vger.kernel.org>; Tue, 01 Sep 2026 08:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788276790; x=1788881590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/qu2uva2bUx60SUUY+PGcI9I5si8eMEKV73xpdWKew=;
        b=HTlkBGoU3BmHwiY40ebShnZmJe1xG8Jm/uNKG/8mU17xMIIrvX7SPZ/ue1WQYKIGTD
         AYaBcFq/S+S3DhmxKBnd++oMY76BBFiOulCR3gKDyGlvKHE2VR234eITO/xaP6ItXPVq
         3Qh2L3sr2Cj3HJY0+VOuc8HC7zliJmxTX9TkE5Lk/IMPhv9MJqPls0DTFQg+3nA5Hpu6
         9MfwmmL2k0FMmvoWuA9ao5dGWhy5RgC4Wvkt7TB9tOEOuXUjgVCmdaktPX1io4ZTr45B
         mQEYfqinOUEUc7M2Jji4hhl7GXl7rZ5QaEuj8HebmuhR9zrduyP7w5/wJ4klr3imw9Oo
         aU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276790; x=1788881590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V/qu2uva2bUx60SUUY+PGcI9I5si8eMEKV73xpdWKew=;
        b=q3q0P6qefFoIK2ypce9ES65XOEQfLGjrbGiti0vl5PAGq/i9TNzbuwsvPuQ4Zck31j
         7gpX7e+Veq/8EcRk7yA9o/6JL/e8wehT3yUDgYHCBWQ40UBqHTwPra0kO9TZNw3igMN8
         0o41/EbqdPEqY3HOltKHSkW8mmwIm0P5SNfbmjwMEBAfGY9HdpetEOMOe5YDjOvQZrhf
         W+L2RTQYvDw+pZnhYT5slU4nRr4jhJwhYXv3yr9XLiESlI4HEw8NjZueVjXkEtgXzQls
         /DMN2IeCn7KPdhYjvw7KFAaeLEaNK1apgx1h/vl8WT3TXO+yQFhHOULrUsqb35s1Mfnr
         NkTA==
X-Forwarded-Encrypted: i=1; AHgh+RpOSyfjTvMSi5rw9pwxlnyc0lFPZdlFQ1+E/Yf61WmmHWcF0kN7Q+XbBUoKjv6Bjyfkq4I0YzeXgIE=@vger.kernel.org
X-Gm-Message-State: AFuF++l2tNr9KsKDtu1UABOqT7sTv+VwKV4lySgcu031uE+KTi0Zk2Cb
	wAKKpQh5N3Zax/Y8Jk5acD+M6wZjWuiohQwc5/td1RK2tHtIfGczzHKh
X-Gm-Gg: AR+sD13NRoVen1FYioF+RuroSvaEHD2PLWJojunBWuTJ2ClKx2CSv7/5gLfuIEtX6cp
	aDCcF92EXZQqr7qxhT2WpVyV4fqmqHxPEqllCTMYbgSu+UBj7Sry/LT/c5W0gW6uHcHk7d+47Tp
	EdR/oY7vZJQP6bS5UgsrqLjaWsqbD1Fg2vrIBiDgGQTo8cNrevQqHcxXzCP3qBe5K6rz5rzIRGd
	+mJy+KLgBivibHqpPXmd6g8BiBAs7Nb6EMb+4bJTLAyJqUPvtRI+w03cfr/GkuWSLx/IYLAg34p
	NtbZyF0XgKSshuRj9t4c65wPH1yxqCAmX3fUBnzS0FVjd4Rt9klWLeLHOxsWnWdi2BniWToNXaR
	4Dn0+UnVbQ/mXK5B4xwSibr0msFhTF39LHn7ZCVecBmL298jHDi6vn7aMLH6lD7NPTzNG0v8M1u
	/ksy495KsZ/Qj6ldCz6rD1UbCFpmRigXhr/Z0V7TK0N6ASNnMbKd4OOlRsw+aYoYB7AbLVho+NY
	lAx2ABjcCbK/d5FYac1E+pJI53ssLVIXDdDhZFbDPoQ/DFWDCVRcXu5
X-Received: by 2002:a05:600c:4f4f:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49cdca4097dmr190627635e9.13.1788276790183;
        Tue, 01 Sep 2026 08:33:10 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c510c9sm235087465e9.0.2026.09.01.08.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:33:09 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <ad0b9721-9528-4c59-b75e-bb52ae24211e@gmail.com>
Date: Tue, 1 Sep 2026 16:33:07 +0100
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc: remove dead 440SP code
To: Frank Li <Frank.li@oss.nxp.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, Frank.Li@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, kernel-janitors@vger.kernel.org, linusw@kernel.org,
 kees@kernel.org, colin.i.king@gmail.com, rosenp@gmail.com, joao@joaoff.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org
References: <20260901150645.1199097-1-julianbraha@gmail.com>
 <apbvL6_WqojjOeRA@SMW015318>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <apbvL6_WqojjOeRA@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/26 16:28, Frank Li wrote:
> On Tue, Sep 01, 2026 at 04:06:45PM +0100, Julian Braha wrote:
>> The 440SP config option can never be enabled, making all references to it
>> dead code.
>>
>> The only board using CONFIG_440SP was IBM LUAN, which was commented out by
>> commit f65573314e4e ("[POWERPC] Re-organize Kconfig code for 4xx in
>> arch/powerpc") then removed by commit ff5f483f3091 ("powerpc: 4xx: remove
>> commented out Kconfig entries").
>>
>> Let's remove support for 440SP, since nobody can be using it anyway.
>>
>> This dead code was found by kconfirm, a static analysis tool for Kconfig.
>>
>> Signed-off-by: Julian Braha <julianbraha@gmail.com>
>> ---
>> Changes since v1:
>> - cleaned up preprocessor condition
>> - added historic details to description
>>
>> Link to v1:
>> https://lore.kernel.org/all/20260816125615.985387-1-julianbraha@gmail.com/
>> ---
>>  arch/powerpc/boot/cuboot-katmai.c   |  2 +-
>>  arch/powerpc/include/asm/async_tx.h |  2 +-
>>  arch/powerpc/include/asm/dcr-regs.h | 10 +++++-----
>>  arch/powerpc/kernel/cpu_specs_44x.h | 12 ------------
>>  arch/powerpc/platforms/44x/Kconfig  |  3 ---
>>  drivers/dma/Kconfig                 |  2 +-
>>  drivers/dma/ppc4xx/adma.c           |  9 ---------
>>  drivers/dma/ppc4xx/adma.h           |  2 +-
>>  drivers/dma/ppc4xx/dma.h            |  9 ---------
> 
> Please split for difference subsystem.
Will do in v4, thanks! (v3 was already sent because of a dumb mistake in
amending the commit.)

- Julian Braha
