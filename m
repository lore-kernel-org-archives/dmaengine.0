Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72783822A9
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 08:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732109; cv=pass; b=evUNspXp9ZVDfst8NRjbAGFZhjr3PiT12U3ROdXVd81k2M6r2/zk/ej+n0sigJYREaYez+mXdwQVVErPSgJ9+5MPdiA/CWU/W6e6j1LtBnhvuxC9yvI8vX0o0FKpD/FO/u124UfkvR3MUuJL85IO4xjR2NgIXHJ1vTCihWtQMmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732109; c=relaxed/simple;
	bh=J+6xXHiRfdSp6lX3gT2enC0bPRKFuLA/vpd3A/BvOkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CwRO/MMnCV0xBGO/dapsvDHkJhFd3duaG/jlkWEaAeZyBWknhEwZcdrxf8Xp41uDjoFuH4PMRD5xrueYYFE2zT8b02uIsIn3/Xj8gJOjJr5pVKtLrwt98fc/6dcmKbT8wnLRjtN1nDflNqbz6uaOyQ8/vTTeZUpA0Ep0zubMzkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l37JN7HK; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l37JN7HK"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66d1bd30d27so1097550d50.0
        for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 01:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787732107; cv=none;
        d=google.com; s=arc-20260327;
        b=kUQROGdxgOwqaeKZrDc7njZzffycOaBqlbYkWLRFhWklZvwZtiUmBsmOAh5hquFgJi
         c/0yx9TTY40EAuP7TUFlP8YzX6V7d0h/doMEAYNYOTDLvHxjd1Rnfx7QWG8y/XcM3ZUM
         jy7BU7XAuOJXuF6M5WQDcGWuYpW3AFHH3TTfGREfslJglluF18FjtW0hi5EIXkBkcVGT
         Xgjva0VWUyIn3veEl/XgNd4Uy/wOIM5Yl0ce5pqbm9kZkZqvEWxU0GxJVdsQ8MZ6cYwz
         ubxx3nx3d1ODdUSaVPppkaDlqiIYUda/emwj70krzsC0Y9d+sprRFxEyiVJ1ReGjTf5A
         Jkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J+6xXHiRfdSp6lX3gT2enC0bPRKFuLA/vpd3A/BvOkk=;
        fh=l/MR47/S2nwSi87e2e0SjjgrLL12+CPdRp+5FQCf/3A=;
        b=MnAJxfjTNV6wgUJ9f627uBuhym6dRVQA7U5vZq2vMY7g+lhKNXBaCAxRP4nsA9kd7K
         NRCJPbPfbPboGPc116Opk+IIprFw2aP95lFT8rBNtT2hmNwvp95MM50DD5LZ+GKpXGe2
         yWVbu3pxumdFAqPLJ0YM1HgQ6EF/rlraIy7v9Rjmkrv+eKFFtyCVrK58QWWLlzU6v3AC
         4cqazeCadcl0q0JDjlUKaKmlu7+YkTjAfSdfIDU+hqgesUkqpIh24aISteoDpVDfbm3n
         Wxqme2n0j0YIPDmT2X6KP8nJYtPc2HDLvoMpoT3RsnuLcjh4euuf9RRDzDYlrEdWs4iK
         mdpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732107; x=1788336907; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+6xXHiRfdSp6lX3gT2enC0bPRKFuLA/vpd3A/BvOkk=;
        b=l37JN7HKqsL0jz5C62YuWOoBr1w7teWTsW2D3/Y3Rroxp7CFI3w0udcv1OgM4pmrpp
         P7oMQz61l5BcUVxBytHBNbhrnq+ea/n65Y01LzQqjy9GiiPIY5eVbQs1y5p5TtyZ6xgm
         dk0UOstpumGechd0+VdjyxCxGOF4SuQFR3W7vR78lM05cS+gPY0+PF0F7cP1dMBMMImw
         dEC/9hgBfEGk5lVNSKjepFRjV1EXxTrULS13ekkD8y2rUDjz9CJvwJqNsHTQqE4/xVT3
         cj/+qm1lG/1SNnrp3f1S0UXnp0v9yws9dK5vuMHL/bzR+oAx7CKU5f3KBIAE0zEc0pLf
         bzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732107; x=1788336907;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J+6xXHiRfdSp6lX3gT2enC0bPRKFuLA/vpd3A/BvOkk=;
        b=ecjaHzKBNjyfbTUjUtcNChbaTcghJHgtl4EjVtmaosrpltn0AT00o4+k0vpBavu0Xb
         zxV+lZ0uKTBOueTk5OUOd3KbGLAjvFOnCeEYFPeRk/al1n3i1RRpvdhxHXDUA6YsrHeS
         1N1pZa7jw0OSy0NA8MCet/E/2QJnlpzsi92TLc/oFmtgZtzYmf+yHbQ0qgoLdr6PexkW
         jzl0xIwhqnlJLVGkCqoRxrI45bLgKQM8ZBdDjJ+JNbJEVqdp/MDkMN1DvoyJzGgKy0vz
         0YDz08Wg/aTYyDlUClPKt+9skdH9MKAFfEZGN9GP55RiAkpkan667ekKX7JKaNKpw2/O
         l7Zw==
X-Forwarded-Encrypted: i=1; AHgh+RpYv2EsrJdIMwrbLgUt9N5RUHZXUJv4SUnyoXhn2BwkVqTR8IEC1I6rXMA7c37R6WL8gtUFw9IYA78=@vger.kernel.org
X-Gm-Message-State: AFuF++k0DxNnV0W/SqVKshBbQgpfUq6XlFdMPGKpGquzzQFYZzkfboze
	+ksEB0HtwEZVDUVLmmsjDI0sLiqyyqB8gI9MGZs92ov6ejYLUJQ6HL56huPvIZPkMXoui952hIC
	xZonh1SIBftKjOujdrYOS5W9d085PS3s=
X-Gm-Gg: AR+sD10JBJzP7AcAGBp8TLrBn0omNUCBqCT9q5KZUZ6vtcJr25gaVCP65kvJkWW/Xgi
	bC/bQ/lGqSVoaawvo/ltgnmhOG95N4gT+GkDHrTEW1emEItvCok6asjIgQE6OKREAFQzoze63Iy
	GscVJP1hNkj5/S1nKySJ7ZW6/QUqsTpqn3oZbNLde8/7Y+ENGcm8l8BQMKvKo9Matck9voWAqlp
	pvSGfOlWaF8r5/u3TzI3mD4zo7E4oMmtkf2oXFXqnBDv0ffHq+4YjGNh0Bm/wfFArhjmx1f1E43
	UHYLuCdzlGc/L6HjLFH8UqpsGnRnFUqZkYMSfQgKObdTRVZ0Esrmrshlqw==
X-Received: by 2002:a05:690e:454b:10b0:66d:273e:117a with SMTP id
 956f58d0204a3-66d273e1bf5mr798137d50.39.1787732106713; Wed, 26 Aug 2026
 01:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808115228.2798481-1-lgs201920130244@gmail.com> <e0a9f6dd-f32d-4ca9-b907-51d8893ecbe9@kernel.org>
In-Reply-To: <e0a9f6dd-f32d-4ca9-b907-51d8893ecbe9@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:14:54 +0800
X-Gm-Features: AcwNN1XvjLCGn-p4IXW7KpCPSyocF03h16h7C3wgzdyHtcsVEfehoAO06tMV-5o
Message-ID: <CANUHTR88n4vtE1_nvaAf2Fpp9u8szu72o+z3O4hefP0C5LySCg@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: xilinx: zynqmp_dma: fix autosuspend cleanup
 during teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Abin Joseph <abin.joseph@amd.com>, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Kedareswara rao Appana <appana.durga.rao@xilinx.com>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 20 Aug 2026 at 22:03, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/08/2026 13:52, Guangshuo Li wrote:
> > zynqmp_dma_probe() calls pm_runtime_use_autosuspend(), but its failure
> > paths and zynqmp_dma_remove() do not call the matching
> > pm_runtime_dont_use_autosuspend().
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during teardown, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > The documentation for pm_runtime_use_autosuspend() also notes that it
> > is important to undo it with pm_runtime_dont_use_autosuspend() at
> > driver exit time, unless runtime PM was initially enabled with
> > devm_pm_runtime_enable().
> >
> > Add the missing pm_runtime_dont_use_autosuspend() calls to the probe
> > failure and remove paths.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>
> You sent vast amount of patches, all separate, making it very difficult
> to track and respond in efficient way. Do not do that.
>
> Group your work per subsystem.
>
> You were asked to clarify and respond to incorrect fixes statement. I do
> not see how you clarified and responded at all.
>
> Best regards,
> Krzysztof

Sorry about that. I should have replied to the earlier review comments
explicitly, and I also should not have sent so many separate patches.

I will group future patches by subsystem and make sure to respond
clearly to review feedback before resending.

Thanks for pointing this out.

Best regards,
Guangshuo
