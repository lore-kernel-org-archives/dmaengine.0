Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E493C4172
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 23:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788217349; cv=pass; b=k2NhTycSV3vTNPKicD/ryHTT/Aky7zhM8dddzU+Hi9E2/ROlD9G51I0EqZ3USLuDZKdt2rHfM9Oh1U7NrAneeA38yuxh9iBCDE0ToIjEi3Alxz+OWv5CLzqiM8QhKqGpg2W+VO6F85qEdUtUvQixnfHs2CfIQ/Ptv+SP7eMGUUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788217349; c=relaxed/simple;
	bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+BWDwKCCCmRl5n8JYWfiHLCUNjTPH7MhlkiBQAhPw+cRZL3zoiaK6T7IinI3LfGME//rJI5OSHUPPmztf5Ab9YX1uxlzT+T0n88v9G49Y+IQ2guqUEOqwGRJfH9WVvxmNUXhvyiWAwRT/17gliC1s/Uf0cwZDWNWEc/gGsAWe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifAx9q3R; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifAx9q3R"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a6010a7234so444536a12.1
        for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 16:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788217346; cv=none;
        d=google.com; s=arc-20260327;
        b=gR84Sf49sGPZ0GZhGM9CYgmoWskNrQlfecLvlYbsU8egeKKTpQ+MuVcgauWZbwDrdw
         FYjkH6DHfLVsaaDqhjPTFJEJa83zsKdYe894phYro6U3xOVTcWrgGBVFKi1vPkVqlAnO
         prQO2UaNA+4UT6ZFxKlyfv08ooemdKxVbsEPsx3rhaJRtdfasPmQK/5b2mjyhU0Pi//f
         tRR08bupaOqOEatvP5fr5Wd8PxbYKNxmP7OYLMYxnrr6k5OpVYyWYfDIm9JbxED8XgX3
         y1T2Rqo0bJWyjnini5rJVFKk7ZE5osJvPeXLQltIZTaaHR8GTyJ5jZiqorncGM2o1ktW
         9pfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
        fh=YDdD/ruX8qzTPNpNTr4q1QgXvODvGenT2KiGa5TBCZM=;
        b=EBdy91MNzd3A0Q6irQXXcgSKTjZ7L/PDObOiMYowKIh1ahu0VIcy/cXwUm4n01BQEr
         3yUaBSQlstzV2xM0AahRU48XfvUTDfdQ00pdmUYdtcEFHFLoAekcmy0VUwuultLJ5CoZ
         lgHZYwgE7L9P66BI3XIKPj223Yva6H9IluN58VW6wHiGD4FajIydpmOBmTCP9BHhO8Yy
         237hzg8zynzKrZn7MkGDCcNYVSsfN92Mo/u0Mt02C9CmIoLI4jClA2sCg1OAkvGRhDAd
         Ffe5wEUsMFAioF2h5JONYPgI9SvIGRf+fRC6QPT3XI6pGuKW4Lq+wACGZ3LQ6FZx7QUU
         qtMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788217346; x=1788822146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
        b=ifAx9q3RlC6ARp0ztxGHiYF8R3lsuyHdfd75Sqji3lFJLwP1kpmViWwvQmd3/yfyf0
         KDR7P0k+mJVSuHGHi9j+Cp30NtYgS7RSnqe/9mj1DIQapHsSAYDHRdYi6QCDWPEegnva
         Q1LwIQMU5eX65XkPV6ONsYL0ILxwlwxtBIK+OrdH40x7apHzJpTM1vL5jLVuDjgf/RRe
         1NXEWoMdp1XPBhOzgUnNUuOqrnuNNC2zkwvQDdXHa+XolulBwfBR49ADVuqUlZ74oufe
         uwWazj5+wpTOwCjT5pOhOa/vx2mfBAyq4Od3vJjLrSSh844fV1Y8S5U5wifmNeX2Ees5
         0RHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788217346; x=1788822146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
        b=e4y/vKRkCmJKnw5m03YFheUKunHTpYWX5Pr6cckEUuDBzPJK+rEQLmCuxp8P8FbY9+
         B9SRvo2TWy1f/tFUgS7nRzI7PmGqNUb3Acm+TYle8UiCG57JZCr71iNZsMkdurA91Mdx
         B3hKIBuz6p1DC4wvY730ww5Shap0nLCSiSQKoNhs9Opr4dGwTHElcS23hA5Midzrp3+H
         MZf8F4FUa+vI/cxDrEHQeUspXkaJq2dxtGWvJPmwysc3vdNpjML9/slC/x4MFn49hW4L
         iygkuLFUwVlj4MkxUJwZzWqh0bUgo5FxPJVfzPVoEjsn7oCHGztN2Y2qgK0g69g7dsRc
         emcg==
X-Forwarded-Encrypted: i=1; AKwUvByb8Ei28p2UcTuu/4DLW322fraBigytI3BES+YOAjp1dsobkdQbZsG+nxp4r2f2QdrigGJZaksvkhk=@vger.kernel.org
X-Gm-Message-State: AFuF++mfYo7Pzrztiao9GIT9cfQEWdYVswvfw4ZjrkNKZEKHpVH1/MFp
	B1pa/QfDSbuG/Mp6FpobrXQMmuvSOb5ltB8X3QyqiX5xs0E2SlJvzUeKClfUacSRjZD3TmO5alw
	jmAIV6XK0Hl8GBuzyjXD++Rjl45L2m3k=
X-Gm-Gg: AYBFou3mBvIxslFfbhAPmz4LGjrXjqbAW4plZMW40IDmxOLBBRx5D0zi+Bxn1semgtS
	3j+WC6Ar3Q5BU2yFnXO69p5FOx55UE49DZG7xqTDlEDZpWV2VXoWd6wabH/F40OGb2FWPO7/yE1
	Tem7nYuMxaIG9fLkCOsmn7Kel9/z5OAT27T0UOupqmvl95DGOY3iV8zcJCOXRwh+lXgxF19V1EJ
	qtpRCQ/veu0BrOprpd7wCXubA8Y01o/QTmnmctSuv64CzY2rJC+v+5hEv5yQTaP5T0sfK9dwgIm
	So5Qj4jeyuoKDjg0Bgr0daq3PC7IhHC7x7Y2sctYSdlwIGDBvhuG0jlfFB1FX+wcN6CKBhBVuCP
	/nzk=
X-Received: by 2002:a05:6402:43c6:b0:6a0:d411:930d with SMTP id
 4fb4d7f45d1cf-6a60d36c8ddmr8084948a12.2.1788217345227; Mon, 31 Aug 2026
 16:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
 <20260818-ti-am33-usb-v2-3-66fd44d66824@gmail.com> <20260831134643.GA733140-robh@kernel.org>
In-Reply-To: <20260831134643.GA733140-robh@kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 1 Sep 2026 04:32:13 +0530
X-Gm-Features: AcwNN1X3HOOhqJKkqX2zS7vFMQd-QWtG1Ec31OOg1tzrgRf7iaa2sG06AC-hKII
Message-ID: <CAOWyW_4RpTD9zAmFDr41sFOj5LtRaGdad7M8QCvQNAQDtamYMA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] ARM: dts: ti: am335x: Fix redundant interrupts
 property in USB nodes
To: Rob Herring <robh@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrzej Siewior <bigeasy@linutronix.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Ravi B <ravibabu@ti.com>, 
	Kumar Gupta <ajay.gupta@ti.com>, Sergei Shtylyov <sshtylyov@ru.mvista.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-omap@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
	daniel.baluta@gmail.com, simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 7:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Aug 18, 2026 at 07:58:45PM +0530, Bhargav Joshi wrote:
> > The am33xx.dtsi defines a single interrupts property for the MUSB nodes=
.
> > Several board-level files override the usb0 node to use
> > interrupts-extended instead to include vbus interrupt.
> >
> > Since both interrupts and interrupts-extended cannot be used
> > simultaneously, Add /delete-property/ interrupts to the overriding
> > nodes to resolve the schema warnings.
>
> Actually, both should be allowed. In theory, an OS version not support
> 'interrupts-extended' and 'interrupts' is also needed for compatibility.
> Though in reality, we've now had 'interrupts-extended' defined for a
> long time. I'll look into what's causing this warning.

Sure will drop this patch in the next version. I also opened pull request t=
o
dt-schema fixing this warning
https://github.com/devicetree-org/dt-schema/pull/206
>
Best Regards,
Bhargav
