Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B310403AF5
	for <dmaengine@vger.kernel.org>; Mon,  3 Aug 2026 12:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785760794; cv=none; b=FdP961iSYUJxQvBbTDi3ks+naLKSk9R4adkNKgG8uZkFraInW20ITvGJQtLSYj2DlSgkkXqCxXxfa3lgkvzj3V+WT8FE5EZJzGwDG0IdOXBx6yinAAxdspMXWfKN+WOSX+5exWlmt1st7WUB5CZ7RJmx9XJFyyvvMb2WOTl5eqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785760794; c=relaxed/simple;
	bh=J9wpk6NpmOuni2B95yTAnUwAvN0XKY4tvdtiA24jRbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWc3xBqjXi3jf+BwJ0zII0beO+9p4QgQMD2qJ3k3tuiA74h7TB+iq+l8TQu5//A9RSvyr9o+QmNEDhtU4GC70ES+GIUoHcs7B+UdV9WkF4qH60QDBaK240bzbgv9koRjmgrV8b5DZJZYa7HJyBJmvoLsP+DBNWcdTjZer5uzHbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZObw3b9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZObw3b9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so9863095e9.2
        for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 05:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785760791; x=1786365591; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t1m8h5r/+tF9JaGxNMMyaW+Gg+qBfAIZ8VU2Ehc+WwM=;
        b=jZObw3b99LwriL5dKNyrJ6jLHSLfmhr5YSOtosNeYAIUvOCqJnZKudMgjwpSDx0LIc
         1RXtPKAwlbCM8IW+0TPiH8jx7AlYKPlTyV5PCBIdhfcmQto+pR82wY2Ltj+yJCdV8jHI
         WA6R8cFR0FfSMF+Xq4LFxEKqPl1cPSy4aMBSGu1ieSp3uuw7CrK1jcdFynHGmxH33rl+
         Xg6EKEo7R0kJVvkFF+80odhK6f2LAxfEj0HAm91CDuezDJ9I3xO1RKkCuU3/ntfRHHNN
         OoS/vzwzwY8Q2Vpyt2xyE7g8iVvkN8elUFLPokJ5yOMHgoAMqoGCn9ePKEOiYmBh3+bf
         UHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785760791; x=1786365591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t1m8h5r/+tF9JaGxNMMyaW+Gg+qBfAIZ8VU2Ehc+WwM=;
        b=iLhkCGgihT8EzD/Bx1DZi4D1YeAaW33ya8J4GKMZbcalFDwBHNDHU1TAnicr8hrBPA
         +H/nSQCbl1Pol//w8knUiJOcciPdNWKi1Gcx4HSPo4VdNP7eJEbsD1n5MtE/G5qCEcBN
         dosvfNkqRAwHSJ4qRKCmpfWwizseBLMMp18k/IRlsSmAUj10GXej+MgZFkPouml68H3E
         XOEUNtLjtISdrGvxX9HNKjFYCCCpSmESGomyqoJQKZqSu2wO1BpJNLhOvf1Vna+4m0Qc
         0O/kn/f64xaYcWiCHXGKNjF4mIS8I4Kbo4lpD9u8zPasEPCD2MGdV2lMMDzG+I0k2rOF
         vcEA==
X-Forwarded-Encrypted: i=1; AHgh+RrbicCD3As17cCsp47lFlf+mxuc8k/5s+0gloCstY+o0Eo8c9qBKXSMHlK89hdOeeMKmnPWWEaRE7A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi/Wosg7zEHwUwG6Q0rKmjshpwkEW58usZ3QjSiynBD2HACEqC
	z8OnmM4S65rJIweD7UsT1TRTM8frtOJPFnZF7LjJFMvkpyXS3EplFvskl/gJAQzI
X-Gm-Gg: AR+sD12Vx5it9Eff9pv82pEPkKVsruId4R1O+lUFnVsFGr0sTg4ApoVTe/vSObDUS2X
	UoM85EaEGb8809P+fcPAH8EfJ2hpP6/g4KBF3gongPtCM4vdDU9qeEYXz1Tkq0BHlhBAe1TBpXE
	hLXdzc9mXHXRPAzzMmtsagr++kTBNWLQ2ASE9/+dc20xdnllYaKahqgwFt1Bv0QZnvmQ+nZ+eYV
	0oyZ/vjjAhp4M8dnu/gYvb0GgBlMBJy1BESvEAQdK9s3L4XZefa0m9mqmA5xmPvMdV6pUTKKFwt
	3exB6BPYSdKPLxKzYkT/Wmp/bYrsqOXnqS7zhTtsOEvl4RswhaLygf6cJRPbqHEl5WMS3KTYFZ3
	+wstyhB/yx4r9J8tYqFaCFFgh8d1hiSLBQ4iE0sStOgq9eUcXOwMEscTAmhFDmtnzlPegzzDit5
	pT1ppoZM2D2Vl+fKLMBsscTEewotbevCtXDPw9436FDEb4JJJtN9NV
X-Received: by 2002:a05:600c:840f:b0:495:5fdf:2075 with SMTP id 5b1f17b1804b1-4980c5fa29amr195199175e9.0.1785760791007;
        Mon, 03 Aug 2026 05:39:51 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b98284sm229214505e9.12.2026.08.03.05.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 05:39:50 -0700 (PDT)
Date: Mon, 3 Aug 2026 13:41:00 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, dmaengine@vger.kernel.org, 
	Frank.Li@kernel.org, vkoul@kernel.org
Subject: Re: [PATCH 5/9] dmaengine: stm32-dma3: Use bus width capability
 helpers
Message-ID: <anCMRfZDO7y5gmtU@nsa>
References: <20260730-dmaengine-support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com>
 <20260730-dmaengine-support-wider-dma-masks-v1-5-3732f1f9d9ca@analog.com>
 <20260730143528.B7ABC1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730143528.B7ABC1F00A3D@smtp.kernel.org>

On Thu, Jul 30, 2026 at 02:35:28PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Direct return on error from `dma_set_src_bus_widths()` or `dma_set_dst_bus_widths()` bypasses clock cleanup, causing a resource leak.
> --

Yeps! This needs fixing in v2.

- Nuno Sá

> 
> --- Patch [5]: [PATCH 5/9] dmaengine: stm32-dma3: Use bus width capability helpers ---
> Please note that the format of this report has been altered due to recitation
> restrictions. The original patch code is not quoted directly, and findings are
> summarized in a free-form text format.
> 
> commit 843bd75e7b8b643c8fda123b493184a039d48a35
> Author: Nuno Sá <nuno.sa@analog.com>
> 
> dmaengine: stm32-dma3: Use bus width capability helpers
> 
> This commit advertises the controller-wide bus width capabilities through the
> new dma_set_src_bus_widths() and dma_set_dst_bus_widths() helpers. It also
> updates the per-channel capability callback to clear unsupported widths
> through the dma_slave_caps helpers.
> 
> [Severity: Medium]
> In the stm32_dma3_probe() function, the patch adds calls to
> dma_set_src_bus_widths() and dma_set_dst_bus_widths(). If either of these
> helper functions returns an error, the code now does a direct return with the
> error code.
> 
> Does this direct return bypass the clock cleanup? 
> 
> Earlier in the probe function, the clock is prepared and enabled via
> clk_prepare_enable(ddata->clk). If an error occurs later, the normal error
> handling path is to goto err_clk_disable to ensure the clock is properly
> disabled. Returning directly here leaves the hardware clock prepared and
> enabled, causing a resource leak.
> 
> Should these return statements be changed to goto err_clk_disable instead?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260730-dmaengine-support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com?part=5
