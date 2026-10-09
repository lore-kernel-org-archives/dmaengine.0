Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8723A48ED;
	Fri,  9 Oct 2026 04:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791519058; cv=none; b=ggB3rh0F8hyln80eQVemRmonszCQkl14wpXFbt/d1b3HKZ2YZ6A9b6XvsXoJtN4FHxm1GwZbei96/MebgMtRdrdDuTK4AxI+BE76xgBWLhFhRhf5WqKT6oUk1Uxjxu6gTUXSNgDtAN0hapcgx65hCacq77TBM9mlG8c3xhVkxWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791519058; c=relaxed/simple;
	bh=lPrbuxY+pwq6VYmlYmi2Nlpu4viLWRMZFfF6uVsnjQo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qa4X2bg67x6nKlT/UwH9eTUJvlqpEI3wLEOScXzZlKhZVrE1kwo0FNmRx981RYX39Wo7NVTFrnItRimg7UgQtxESXt1XbedvFDyE8E9eUZ4RehwG9ufQdbIUFalJ6U2gG7SF67Rq3JPxO9De+z+3cVMjxqQlXWPumc+/2bwUQIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkE3tT5Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkE3tT5Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C271F000FF;
	Fri,  9 Oct 2026 04:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791519054;
	bh=/QzlLV4sOfC8NnYusQ93I99PFtb2KqRit0CeeQ24H8U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RkE3tT5QMQLs9KLcTI44QvCyPjpz/kRbsz1dA11e8jr0/O5o629eR9wbJOos4juCL
	 zQyHva+oqUfCRJShn1U8BiBmNtg+17mHnsz7GSCVvowDeru5GTRnnCkZUWTBFtuWJk
	 OEJerRSFoeLhs0W5BIUrMWgyXkZk1lzIjeWvvowBG81dVyr95EItILs2aEKnjGOUhQ
	 AeZsl4n3OI4W5EU9PNsgdpcb7HMTzK7K7qX6axwRt4JDdum2JuAkF9IxQzAhJJUcPk
	 eWNOVDZJl86ivGBaeQsRpUAbPoD2uh3d+yE2+KOfIpoCtybugPyDW6aaGTUqdBMpRX
	 wc8fm3sAFr2ZQ==
Message-ID: <sashiko-outbox-164816@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/6] PM: runtime: Add pm_runtime_if_active guard and
 conditional variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20261009-adma-pm-fix-and-per-channel-reset-v4-2-55f5fe409c55@amd.com>
References: <20261009-adma-pm-fix-and-per-channel-reset-v4-0-55f5fe409c55@amd.com>
 <20261009-adma-pm-fix-and-per-channel-reset-v4-2-55f5fe409c55@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 04:10:53 +0000
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pm: TOCTOU race in pm_runtime_if_active_try allows hardware access=
 on suspended device
- [Medium] pm: pm_runtime_if_active base guard causes usage_count underflow=
 if used directly
--

commit 90c398317818a4245091ccf1d776dfe02e35d94e
Author: Golla Nagendra <nagendra.golla@amd.com>

PM: runtime: Add pm_runtime_if_active guard and conditional variant

This commit introduces a pm_runtime_if_active base guard and its _try
conditional variant to allow drivers to conditionally acquire a runtime
PM reference only when the device is already active.

> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> index 322e3b17f9871..41804e8480427 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h

[ ... ]

> @@ -645,6 +645,13 @@ DEFINE_GUARD(pm_runtime_active, struct device *,
>  	     pm_runtime_get_sync(_T), pm_runtime_put(_T));
>  DEFINE_GUARD(pm_runtime_active_auto, struct device *,
>  	     pm_runtime_get_sync(_T), pm_runtime_put_autosuspend(_T));
> +/*
> + * Do not use directly -- the destructor calls pm_runtime_put()
> + * unconditionally, which underflows if no reference was acquired.
> + * Use only via the _try variant below.
> + */
> +DEFINE_GUARD(pm_runtime_if_active, struct device *,
> +	     pm_runtime_get_if_active(_T), pm_runtime_put(_T));

[Severity: Medium]
Is there a risk that this base guard will be used directly despite the
comment?

If used via guard(pm_runtime_if_active), pm_runtime_get_if_active() does
not acquire a reference when the device is suspended, but the destructor
unconditionally calls pm_runtime_put().

Can this underflow the usage_count and permanently break the device's
power management state?

Since the _try variant overrides the lock expression, could the base guard
be safely defined using pm_runtime_get_noresume() instead of
pm_runtime_get_if_active() to prevent this?

[ ... ]

> @@ -660,6 +667,23 @@ DEFINE_GUARD_COND(pm_runtime_active_auto, _try,
>  		  pm_runtime_get_active(_T, RPM_TRANSPARENT), _RET =3D=3D 0)
>  DEFINE_GUARD_COND(pm_runtime_active_auto, _try_enabled,
>  		  pm_runtime_resume_and_get(_T), _RET =3D=3D 0)
> +/*
> + * The _try contract is that no error is produced when runtime PM is dis=
abled,
> + * so bypass the guard when pm_runtime_get_if_active() returns -EINVAL: =
take a
> + * reference with pm_runtime_get_noresume() to pre-balance the destructo=
r's
> + * pm_runtime_put() and return 1 so the guard condition succeeds. Interr=
upt
> + * handlers then keep servicing interrupts when runtime PM is disabled f=
or the
> + * device or CONFIG_PM is not enabled.
> + */
> +DEFINE_GUARD_COND(pm_runtime_if_active, _try,
> +		  ({
> +			int _r =3D pm_runtime_get_if_active(_T);
> +
> +			if (_r =3D=3D -EINVAL)
> +				pm_runtime_get_noresume(_T);
> +			_r =3D=3D -EINVAL ? 1 : (_r ?: -EAGAIN);
> +		  }),
> +		  _RET =3D=3D 1)

[Severity: High]
Does this regression allow a race condition that leads to hardware access
on a suspended device?

pm_runtime_get_if_active() checks the state under dev->power.lock and then
drops the lock before returning -EINVAL.

Could a concurrent thread enable and suspend the device immediately after
the lock is dropped:

Thread 1
_r =3D pm_runtime_get_if_active(_T); // returns -EINVAL, drops lock

Thread 2
pm_runtime_enable(dev);  // disable_depth becomes 0
pm_runtime_suspend(dev); // device is now suspended

Thread 1 continues
if (_r =3D=3D -EINVAL)
    pm_runtime_get_noresume(_T); // increments usage_count outside lock

The macro then evaluates to 1, indicating success.

Does this trick the caller into treating the device as active, causing
interrupt handlers to perform MMIO accesses on powered-down hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-adma-pm-fi=
x-and-per-channel-reset-v4-0-55f5fe409c55@amd.com?part=3D2
