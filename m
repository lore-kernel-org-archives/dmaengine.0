Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982723769E9;
	Mon, 10 Aug 2026 10:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357503; cv=none; b=tKuNJd9u2hZ44GK9ljToWjFbu2/h3YubzEmX/YPdUKGCjJ6dZ8m5xg/zWUpP0e+1tC5hUZON8gO0tYsxvRWE3njlJYe61tBGE5sAO9oxnvySYZojXb13zcMHZuRWKvJwtqFABfSGe87RjZNB9LCc9P1quncMrzkkwpIozD4wkGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357503; c=relaxed/simple;
	bh=fQLZE8E5+2oHHj/64Dzh0mv/tE3ZxAsII/tE8/QDQwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hNgh4zYbwasGJEeuHp3/CnNuiQmJPKDEZvo0RIAmGp/4rfUU0tqN3qUgpevf6qFn3FhUajzK2kZG6MX0W2y0bO+N13vTQvdqEllXThbJ2TqxwijIHhoQxRYe39sYhZmfPx893a493XUVOyHHimwoWayiKnQCT7Tb+g3PoqHjmSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wi7s99eG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wi7s99eG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8321F000E9;
	Mon, 10 Aug 2026 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786357502;
	bh=rMOKWR44unq3vE1S0I6Qw9YY+EVAFITDcaIj2jHNfiQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wi7s99eGchY1cj75NrnnUXIIhUhfn09dhdXJpCe+6CKoXJscEyetZ5WqwztU+uyQe
	 B9iE8AC+2NNZh5/HDCljKS+jhPXNJrQgym/+igCy5Jbl9bl+gCg8q92Zuf6KCmvjkb
	 K6hIxbf2TLdZmNETGvSd9QBqWthscPN/QziWERvD1lRuDmvbWJrnrdRgtwiYfmeXQs
	 8D56tfNcd7Y+WgdcpR23S64guBF11JNQ/xJ+UPedHEWKo6OZgw5kyhXPrTdBjxc2dR
	 dPWkeDUxplJjHTNm4zmSczBcGXLlSPW8NQjY26TLZHMsREIm7gyXlXKoscyZX6UqO+
	 l51eV4TQy/L4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 2/6] PM: runtime: Add pm_runtime_if_active guard and
 conditional variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Golla Nagendra" <nagendra.golla@amd.com>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260810100452.426320-3-nagendra.golla@amd.com>
References: <20260810100452.426320-1-nagendra.golla@amd.com>
 <20260810100452.426320-3-nagendra.golla@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 10:25:00 +0000
Message-Id: <20260810102501.9F8321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `pm_runtime_if_active_try` guard evaluates to an error when ru=
ntime PM is disabled, violating the API contract and breaking IRQ handlers.
- [Medium] The conditionally defined base guard `guard(pm_runtime_if_active=
)` silently corrupts the runtime PM usage counter if used directly.
--

--- Patch [2]: [PATCH V3 2/6] PM: runtime: Add pm_runtime_if_active guard a=
nd conditional variant ---
commit 57173006d8cc8596d1863023936dfd41e4325af1
Author: Golla Nagendra <nagendra.golla@amd.com>

PM: runtime: Add pm_runtime_if_active guard and conditional variant

Add a pm_runtime_if_active base guard and its _try conditional variant
to pm_runtime.h for drivers that need to conditionally acquire a runtime
PM reference only when the device is already active.

> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -609,6 +609,13 @@ DEFINE_GUARD(pm_runtime_active, struct device *,
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
While the comment warns against direct usage, does exposing this base
guard via DEFINE_GUARD in include/linux/pm_runtime.h create a risky API
footgun?

If a developer uses guard(pm_runtime_if_active)(&dev) directly and the
device is not active, pm_runtime_get_if_active() returns 0 without
incrementing the usage counter. At scope exit, the destructor
unconditionally calls pm_runtime_put(), which would underflow the usage
counter and could prevent the device from suspending.

Could a lock-tracking guard like DEFINE_LOCK_GUARD_1 be used instead to
avoid defining an unsafe base guard?

>  /*
>   * Use the following guards with ACQUIRE()/ACQUIRE_ERR().
>   *
> @@ -624,6 +631,8 @@ DEFINE_GUARD_COND(pm_runtime_active_auto, _try,
>  		  pm_runtime_get_active(_T, RPM_TRANSPARENT), _RET =3D=3D 0)
>  DEFINE_GUARD_COND(pm_runtime_active_auto, _try_enabled,
>  		  pm_runtime_resume_and_get(_T), _RET =3D=3D 0)
> +DEFINE_GUARD_COND(pm_runtime_if_active, _try,
> +		  pm_runtime_get_if_active(_T) ?: -EAGAIN, _RET =3D=3D 1)

[Severity: High]
Does this strict condition break interrupt handlers when runtime PM is
disabled?

If CONFIG_PM is disabled (or runtime PM is not enabled for the device),
pm_runtime_get_if_active() returns -EINVAL. With the _RET =3D=3D 1 check
in DEFINE_GUARD_COND, the guard condition fails and evaluates to
ERR_PTR(-EINVAL).

If a driver uses PM_RUNTIME_ACQUIRE_IF_ACTIVE() in an interrupt handler
on such a system, the handler will bail out instead of servicing the valid
interrupt. This can lead to an unhandled IRQ storm that permanently
disables the device's interrupt line.

The documented API contract for _try guards states they do not produce
an error when runtime PM is disabled. Should this handle the -EINVAL
case to safely bypass the guard when PM is disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810100452.4263=
20-1-nagendra.golla@amd.com?part=3D2
